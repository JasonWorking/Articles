##类簇子类化问题

@References:
	
	@iBcker 一个能跑去给服务器找bug的风一样的少年 
	
	@jiangrui 专业翻墙20年

	@zaishi 	叫大仙 不解释


	
####名词定义：
1. 类 ： 本文中`类`泛指isa指针所指Class
2. 类对象: 一个Class object，因为OC中类本身也是有isa指针,也是一个对象.


####问题：
iOS的`Foundation`中有很多类簇，如`NSDictionary`、`NSString`、`NSArray`、`NSNumber`.假设现在子类化一个`NSDictionary`:
 
	@interface CustomDictionary : NSDictionary
	
	@end

	@implementation CustomDictionary

	@end


在子类`CustomDictionary`中什么都不做,先抛开Apple文档说明的子类化一个NSDictionary时必须实现的那几个方法不看,假装不知道,完全按照面向对象的一般思想想问题,然后做如下试验：



	int main(int argc, char * argv[]) {
	    @autoreleasepool {
	        NSDictionary *dict = [[NSDictionary alloc]
	        initWithObjectsAndKeys:@"object1",@"key1", nil];
	 //断点1       
	        CustomDictionary *cDic = [[CustomDictionary alloc] 
	        initWithObjectsAndKeys:@"object1",@"key1", nil]; //line 1
	          
	        return UIApplicationMain(argc, argv, nil,
	        NSStringFromClass([AppDelegate class]));
	    }
	}
	


按照一般的OOP的思想,由于 在子类中并未对父类做任何修改,那么在 `line1`调用 `alloc`和`initWithObjectsAndKeys:`这两个方法，`cDic`应该与父类`NSDictionary`的实例化得到的对象拥有完全一样的方法或者说能力,那么应该是没有问题的。于是， 运行，看一下结果,注意在`line1`前设置了一个断点:



	(lldb) po  [dict allKeys]
	&lt;__NSArrayI 0x7fb7e340f4c0&gt;(
	key1
	)



运行至`断点1`处显然不会有任何问题,然后 打印出来`[dict allKeys]`的结果，可以看到是一个`__NSArrayI`对象，里面为`key1`，这是一个符合预期的结果.(这个`__NSArrayI`的意思是一个不可变的(immutable)数组对象,暂不作进一步讨论这个对象的类是什么类，且把他看作一个`NSArray`类实例化得到的一个对象.).

接下来,运行`line1`,程序Crash,错误信息如下:


	 *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '***
	 -[NSDictionary initWithObjects:forKeys:count:]: method only defined for abstract class.  
	 Define -[CustomDictionary initWithObjects:forKeys:count:]!'



这里可以看出,当 调用`initWithObjectsAndKeys:`时,需要调用`initWithObjects:forKeys:count:`**这个Designated Initializer**，好理解.但是虽然 是没有在`CustomDictionary`中定义这个方法，但是按 之前的期望，第一步`[CustomDictionary alloc]` 这里应该调用的是`NSDictionary`的`alloc`，然后返回一个对象后再次调用`NSDictionary`的`initWithObjectsAndKeys:`方法，看起来和直接使用 `[[NSDictionary alloc] initWithObjectsAndKeys]` 没什么区别啊，为什么这里就说没有`initWithObjects:forKeys:count:`这方法了呢？为什么`[[NSDictionary alloc] initWithObjectsAndKeys]`调用时没有问题，而用 自己的 `CustomDictionary`类调用就出了问题呢？



####分析
这就是类簇的子类化的奥妙所在了. 做如下分析:
首先， 把｀[[NSDictionary alloc] initWithObjectsAndKeys:@"object1",@"key1", nil];`拆开：


	id  someObject = [NSDictionary alloc];
	dict = [someObject init];



然后 打印 ｀someObject`的类对象:


	(lldb) po [someObject class]
	__NSPlaceholderDictionary

可以看到这里alloc返回的是一个`__NSPlaceholderDictionary`类对象.

同样的 对｀[[CustomDictionary alloc] initWithObjectsAndKeys:@"object1",@"key1", nil];`拆开:


	id  someObjectC = [NSDictionary alloc];
	cDic = [someObjectC init];



然后 打印 ｀someObjectC`的类对象: 

	(lldb) po [someObjectC class]
	CustomDictionary


可以看到这里alloc返回的是一个`CustomDictionary`类对象.按照 之前的分析，由于这里仍然调用的是`NSDictionary`的`alloc`方法，那么返回的`someObjectC`的class应该仍然是` __NSPlaceholderDictionary`才对，但是把这个打印出来，返回的居然是：`CustomDictionary`， 自己的类的指针。

其底层的原理就是：NSDictionary alloc时有个中间层，就是 上面看到的 __NSPlaceholderDictionary.
 alloc的对象先统一为这个类对象之后，在后面调用 __NSPlaceholderDictionary的类方法时，比如initWithObjectsAndKeys 才返回具体的类，即在__NSPlaceholderDictionary这一层做个“代理工厂”，根据调用的不同init方法再返回具体的类。
 
  开始对`alloc`这个方法产生的兴趣,这个方法在NSObject中实现，NSDicionary继承自NSObject，NSObject中`alloc`实现为：
 
 
	 + (id) alloc
	{
	  return [self allocWithZone: NSDefaultMallocZone()];
	}
	 
 
 
 当执行`[NSDictionary alloc]`时,由runtime的消息转发机制会转到NSDictionary父类NSObject的alloc中执行,其中`self`是当前消息的receiver,在 现在的情况下就是NSDictionary类对象。于是 转而关心`NSDictionary`中对`allocWithZone`的实现了.
 
 GNUStep上对NSDictionary的`allocWithZone:`实现：
 
 
 
	 + (id) allocWithZone: (NSZone*)z
	{
	  if (self == [NSDictionary Class])
	    {
	      return NSAllocateObject(NSPlaceholderDictionary, 0, z);
	    }
	  else
	    {
	      return NSAllocateObject(self, 0, z);
	    }
	}

 
 
 
####结果 1 
 可以发现，当只用`NSDictionary`调用`alloc`的时候，由于`self == [NSDictionary class]`，所以这时返回的是`NSPlaceholderDictionary`的类对象；而使用其他类（比如派生类）调用`alloc`时，返回的是`super`的 `alloc`，这里也就是`[NSObject alloc]`，而`NSObject`的`alloc`方法返回的是调用类的类对象，所以在用自己的`CustomDictionary`类调用时，返回的就是`CustomDictionary`类的类对象了。 
 
 那为什么明明`NSDictionary`中明明定义了`initWithObjects:forKeys:count`方法，但是必须要一个定义了（覆盖）`initWithObjects:forKeys:count`的子类返回时才能正常运行呢？来看一下`NSDictionary`中对`initWithObjects:forKeys:count`的实现：
 
 


	- (id) initWithObjects: (const id[])objects
		       forKeys: (const id [])keys
			 count: (NSUInteger)count
	{
	    return [self subclassResponsibility: _cmd];
	}
	
	- (id) subclassResponsibility: (SEL)aSel
	{
	  char	c = (class_isMetaClass(object_getClass(self)) ? '+' : '-');
	
	  [NSException raise: NSInvalidArgumentException
	    format: @"[%@%c%@] should be overridden by subclass",
	    NSStringFromClass([self class]), c,
	    aSel ? (id)NSStringFromSelector(aSel) : (id)@"(null)"];
	  return self;	// Not reached
	}



 可以看到,在`NSDictionary`中对`initWithObjects:forKeys:count:`的实现，就是抛出一个异常，若直接调用`NSDictionary`的该方法就会Crash,所以必须是一个覆盖了该方法的子类才能调用`initWithObjects:forKeys:count:`方法.这就是为什么当使用`__NSPlaceholderDictionary`时不会Crash(__NSPlaceholderDictionary中覆盖了该方法)，而当使用自己写的没有覆盖该方法的子类`CustomDictionary`时就会Crash的原因.
 
 
####继续分析：
 
 Apple的文档中对子类化NSDictionry时候要求实现的四个方法：
 
	 
	 Methods to Override
	If you do need to subclass NSDictionary, take into account that it is a class cluster.
	Any subclass must override the following primitive methods:
	
	initWithObjects:forKeys:count:
	
	  @property count
	
	objectForKey:
	
	keyEnumerator:
	
	The other methods of NSDictionary operate by invoking one or more of these primitives. 
	The non-primitive methods provide convenient ways of accessing multiple entries at once.

 
 而在NSDictionary中对其他三个方法的实现完全类似:
 
 
	 - (NSEnumerator*) keyEnumerator
	{
	  return [self subclassResponsibility: _cmd];
	}
	
	- (id) objectForKey: (id)aKey
	{
	  return [self subclassResponsibility: _cmd];
	}
	
	- (NSUInteger) count
	{
	  [self subclassResponsibility: _cmd];
	  return 0;
	}

 
 
 
 
其实在调用`[NSDictionary alloc]`时候返回的`__NSPlaceholderDictionary`类对象就是`NSDictionary`类对象的一个子类:
 
 
	 (lldb)  po [__NSPlaceholderDictionary isSubclassOfClass:[NSDictionary class]]
	
	true

 
 
 `[[NSDictionary alloc] init]`返回的也是一个 `__NSDicionaryI`类的对象,也是NSDictionary的一个子类
 

	(lldb) po [__NSDictionaryI isSubclassOfClass:[NSDictionary class]]
	
	true


 
如果 在子类化时不实现上面文档中四个方法,就会在使用特定的方法的Crash,如前面所做的那样不覆盖`initWithObjects:forKeys:count:`方法的话， 在`initWithObjectsAndKeys:`时就会Crash; 如果 不实现`@property count`, 当调用 `allKeys`时就会在该方法抛出异常(当然,直接调用count也会Crash).


####总之


在子类化一个NSDictionary时,不对父类做任何修改的前提下并没有具备父类完全一样的方法的原因NSDictionary在alloc和init时返回的实际上是NSDicationary的子类,覆盖了NSDictionary中一些特定的方法(primitives methods)。


~~**Apple文档中对子类化NSDictionary有较详细的说明,并给出了两种不同形式的实现方式.但个人偏见认为，子类化类簇应该是个Bad idea**
~~

Foundation中的实现是在alloc时判断调用者的类型,并在primitives methods中抛出异常. 当然，这么做的原因还是保持类簇或者说抽象工厂模式的初衷：隐藏实现细节.


####扩展

理解了NSDictionary这个类簇的实现和子类化时的问题,可以引申到NSString(已验证)、NSArray（未验证）、NSNumber（未验证）这些类簇的实现和子类化，本质上都是一样的。

####补充
根据[@iBcker](http://ibcker.me)分享,其使用Xcode自带的添加symbol breakpoint的方式来追踪了类簇实例化一个对象时所调用的方法,得到的结论与以上通过分析Core Foundation源码得到的结论一致.

其分析过程通过添加 objc_msgSend 符号断点,并在断点处的添加两个action:

  1.po object_getClass($rdi)  //打印调用者所属类

  2.x/s $rsi   //打印调用的方法名

  	
可以看到类簇在实例化一个对象时底层真正调用了哪些方法、以及分别是谁调用的.

















