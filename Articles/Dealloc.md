### Dealloc 在哪个线程执行[^1]
---

###1. 如果是一道选择题，那么有可能的选择是[^1]：

> A. 所有对象的dealloc方法会在主线程调用
> B. 一个对象的dealloc方法会在分配该对象的线程被调用
> C. 一个对象的dealloc方法会在该对象的引用计数变为0的线程被调用

一小段代码便可以试出答案：

```

#import "ViewController.h"

@interface ClassFoo : NSObject
@end

@implementation ClassFoo

- (void)dealloc
{
    NSLog(@"dealloc is excuted in thread : %@, object : %@", [NSThread currentThread], self);
}

@end



@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _array = [NSMutableArray array];
    ClassFoo *objectFoo = [[ClassFoo alloc] init];
    NSLog(@"Thread: %@, object : %@", [NSThread currentThread],objectFoo);
    [_array addObject:objectFoo];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [[NSThread currentThread] setName:@"DISPATCH_QUEUE_Thread_Custom"];
        [_array removeAllObjects];
    });
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [_array removeAllObjects];
//    });
    
    
    
}


@end



```





运行得到的输出为: 

```
2015-06-24 14:27:15.261 DeallocDemo[53565:38948231] Thread: <NSThread: 0x7fcaa2c28aa0>{number = 1, name = main}, object : <ClassFoo: 0x7fcaa2d1f810>
2015-06-24 14:27:15.262 DeallocDemo[53565:38948390] dealloc is excuted in thread : <NSThread: 0x7fcaa2e0ca30>{number = 2, name = DISPATCH_QUEUE_Thread_Custom}, object : <ClassFoo: 0x7fcaa2d1f810>

```

可见, `objectFoo` 的分配是在主线程, 然后用一个数组来强引用到该对象, 并在一个`dispatch_queue`里清空数组,以达到释放 `objectFoo`的目的,输出的结果表明答案应该选 `C: 一个对象的dealloc方法会在该对象的引用计数变为0的线程被调用 `.



###2. 在 [@Matt Galloway](https://twitter.com/mattjgalloway) 的《Effective Objective-C 2.0》中（page164）对这个问题有描述：

*Also, the dealloc method is called on the thread in which the final release that caused the retain count to zero occurred.* 
---


[^1]:[@CarinaT](https://github.com/CarinaTT)在一次电话面试时问过我这个问题. 
