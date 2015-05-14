Date: 2015-05-12  
Title: Danger of Method Swizzling  
Published: true  
Type: post  

## Danger of Method Swizzling 


Using method sizzling is like using sharp knives in the kitchen. Some people are scared of sharp knives because they think they'll cut themselves badly, but the truth is that sharp knives are safer.

Method swizzling can be used to write better, more efficient, more maintainable code. It can also be abused and lead to horrible bugs.

###Background

As with all design patters, if we are fully aware of the consequences of the pattern, we are able to make more informed decisions about whether or not to use it. Singletons are a good example of something that's pretty controversial, and for good reason — they're really hard to implement properly. Many people still choose to use singletons, though. The same can be said about swizzling. You should form your own opinion once you fully understand both the good and the bad.

###Discussion

Here are some of the pitfalls of method swizzling:

Method swizzling is not atomic
Changes behavior of un-owned code
Possible naming conflicts
Swizzling changes the method's arguments
The order of swizzles matters
Difficult to understand (looks recursive)
Difficult to debug
These points are all valid, and in addressing them we can improve both our understanding of method swizzling as well as the methodology used to achieve the result. I'll take each one at a time.

###Method swizzling is not atomic

I have yet to see an implementation of method swizzling that is safe to use concurrently1. This is actually not a problem in 95% of cases that you'd want to use method swizzling. Usually, you simply want to replace the implementation of a method, and you want that implementation to be used for the entire lifetime of your program. This means that you should do your method swizzling in +(void)load. The load class method is executed serially at the start of your application. You won't have any issues with concurrency if you do your swizzling here. If you were to swizzle in +(void)initialize, however, you could end up with a race condition in your swizzling implementation and the runtime could end up in a weird state.

###Changes behavior of un-owned code

This is an issue with swizzling, but it's kind of the whole point. The goal is to be able to change that code. The reason that people point this out as being a big deal is because you're not just changing things for the one instance of NSButton that you want to change things for, but instead for all NSButton instances in your application. For this reason, you should be cautious when you swizzle, but you don't nee to avoid it altogether.

Think of it this way... if you override a method in a class and you don't call the super class method, you may cause problems to arise. In most cases, the super class is expecting that method to be called (unless documented otherwise). If you apply this same thought to swizzling, you've covered most issues. Always call the original implementation. If you don't, you're probably changing too much to be safe.

###Possible naming conflicts

Naming conflicts are an issue all throughout Cocoa. We frequently prefix class names and method names in categories. Unfortunately, naming conflicts are a plague in our language. In the case of swizzling, though, they don't have to be. We just need to change the way that we think about method swizzling slightly. Most swizzling is done like this:

```
@interface NSView : NSObject
- (void)setFrame:(NSRect)frame;
@end

@implementation NSView (MyViewAdditions)

- (void)my_setFrame:(NSRect)frame {
    // do custom work
    [self my_setFrame:frame];
}

+ (void)load {
    [self swizzle:@selector(setFrame:) with:@selector(my_setFrame:)];
}

@end
```
This works just fine, but what would happen if my_setFrame: was defined somewhere else? This problem isn't unique to swizzling, but we can work around it anyway. The workaround has an added benefit of addressing other pitfalls as well. Here's what we do instead:

```
@implementation NSView (MyViewAdditions)

static void MySetFrame(id self, SEL _cmd, NSRect frame);
static void (*SetFrameIMP)(id self, SEL _cmd, NSRect frame);

static void MySetFrame(id self, SEL _cmd, NSRect frame) {
    // do custom work
    SetFrameIMP(self, _cmd, frame);
}

+ (void)load {
    [self swizzle:@selector(setFrame:) with:(IMP)MySetFrame store:(IMP *)&SetFrameIMP];
}

@end

```
While this looks a little less like Objective-C (since it's using function pointers), it avoids any naming conflicts. In principle, it's doing the exact same thing as standard swizzling. This may be a bit of a change for people who have been using swizzling as it has been defined for a while, but in the end, I think that it's better. The swizzling method is defined thusly:

```
typedef IMP *IMPPointer;

BOOL class_swizzleMethodAndStore(Class class, SEL original, IMP replacement, IMPPointer store) {
    IMP imp = NULL;
    Method method = class_getInstanceMethod(class, original);
    if (method) {
        const char *type = method_getTypeEncoding(method);
        imp = class_replaceMethod(class, original, replacement, type);
        if (!imp) {
            imp = method_getImplementation(method);
        }
    }
    if (imp && store) { *store = imp; }
    return (imp != NULL);
}

@implementation NSObject (FRRuntimeAdditions)
+ (BOOL)swizzle:(SEL)original with:(IMP)replacement store:(IMPPointer)store {
    return class_swizzleMethodAndStore(self, original, replacement, store);
}
@end

```

###Swizzling changes the method's arguments

This is the big one in my mind. This is the reason that standard method swizzling should not be done. You are changing the arguments passed to the original method's implementation. This is where it happens:

```
[self my_setFrame:frame];
```

What line does is:

objc_msgSend(self, @selector(my_setFrame:), frame);
Which will use the runtime to look up the implementation of my_setFrame:. Once the implementation is found, it invokes the implementation with the same arguments that were given. The implementation it finds is the original implementation of setFrame:, so it goes ahead and calls that, but the _cmd argument isn't setFrame: like it should be. It's now my_setFrame:. The original implementation is being called with an argument it never expected it would receive. This is no good.

There's a simple solution — use the alternative swizzling technique defined above. The arguments will remain unchanged!

###The order of swizzles matters

The order in which methods get swizzled matters. Assuming setFrame: is only defined on NSView, imagine this order of things:

```
[NSButton swizzle:@selector(setFrame:) with:@selector(my_buttonSetFrame:)];
[NSControl swizzle:@selector(setFrame:) with:@selector(my_controlSetFrame:)];
[NSView swizzle:@selector(setFrame:) with:@selector(my_viewSetFrame:)];
```
What happens when the method on NSButton is swizzled? Well most swizzling will ensure that it's not replacing the implementation of setFrame: for all views, so it will pull up the instance method. This will use the existing implementation to re-define setFrame: in the NSButton class so that exchanging implementations doesn't affect all views. The existing implementation is the one defined on NSView. The same thing will happen when swizzling on NSControl (again using the NSView implementation).

When you call setFrame: on a button, it will therefore call your swizzled method, and then jump straight to the setFrame: method originally defined on NSView. The NSControl and NSView swizzled implementations will not be called.

But what if the order were:

```
[NSView swizzle:@selector(setFrame:) with:@selector(my_viewSetFrame:)];
[NSControl swizzle:@selector(setFrame:) with:@selector(my_controlSetFrame:)];
[NSButton swizzle:@selector(setFrame:) with:@selector(my_buttonSetFrame:)];
```

Since the view swizzling takes place first, the control swizzling will be able to pull up the right method. Likewise, since the control swizzling was before the button swizzling, the button will pull up the control's swizzled implementation of setFrame:. This is a bit confusing, but this is the correct order. How can we ensure this order of things?

Again, just use load to swizzle things. If you swizzle in load and you only make changes to the class being loaded, you'll be safe. The load method guarantees that the super class load method will be called before any subclasses. We'll get the exact right order!

###Difficult to understand (looks recursive)

Looking at a traditionally defined swizzled method, I think it's really hard to tell what's going on. But looking at the alternative way we've done swizzling above, it's pretty easy to understand. This one's already been solved!

###Difficult to debug

One of the confusions during debugging is seeing a strange backtrace where the swizzled names are mixed up and everything gets jumbled in your head. Again, the alternative implementation addresses this. You'll see clearly named functions in backtraces. Still, swizzling can be difficult to debug because it's hard to remember what impact the swizzling is having. Document your code well (even if you think you're the only one who will ever see it). Follow good practices, and you'll be alright. It's not harder to debug than multi-threaded code.

###Conclusion

Method swizzling is safe if used properly. A simple safety measure you can take is to only swizzle in load. Like many things in programming, it can be dangerous, but understanding the consequences will allow you use it properly.

###
 Using the above defined swizzling method, you could make things thread safe if you were to use trampolines. You would need two trampolines. At the start of the method, you would have to assign the function pointer, store, to a function that spun until the address to which store pointed to changed. This would avoid any race condition in which the swizzled method was called before you were able to set the store function pointer. You would then need to use a trampoline in the case where the implementation isn't already defined in the class and have the trampoline lookup and call the super class method properly. Defining the method so it dynamically looks up the super implementation will ensure that the order of swizzling calls does not matter.