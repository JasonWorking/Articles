Date: 2015-05-12  
Title: 证明UIViewContrller中viewDidLoad和viewWillAppear在runloop的同一次循环中  
Published: true  
Type: post  

---
## 证明UIViewContrller中viewDidLoad和viewWillAppear在同一次`event loop`中（runloop的同一次循环中）

### 1 测试环境：
1. 模拟器iOS7,模拟器iOS8

### 2 预备知识：
1. ARC下方法命名与内存管理之间的关系：
	* 若方法名以以下词语开头，其返回的对象归调用者所有. 
		* alloc
		* new
		* copy
		* mutableCopy 
	* 若方法名不以上述4个词语开头，且返回后不需要retain操作,即没有strong指针指向返回值,则其返回值是autorelease的.[^1]

2. autorelease的对象会加入到autoreleasePool中，每一个runloop循环会drain一次autoreleasePool,对pool中的对象发送release消息。

3. 若在viewDidLoad中初始化一个autorelease对象，若在viewWillAppear中该对象仍未释放，则证明二者在同一次event loop 中.


### 测试代码：

```
@implementation ViewController

__weak id string = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //这里使用的初始化函数如果是 [[NSString alloc］initWithFormat:@"aaa"];
    //则返回的字符串并不是autorelease的，不支持本次测试.
    NSString *object = [NSString stringWithFormat:@"aaa"];
    NSLog(@"%@,%s", object,__func__);
   string = object;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%@,%s", string,__func__);
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%@,%s", string,__func__);
}
```
	
### 输出结果：

```
2015-05-12 17:25:48.036 Layout[12135:607] aaa,-[ViewController viewDidLoad]
2015-05-12 17:25:53.104 Layout[12135:607] aaa,-[ViewController viewWillAppear:]
2015-05-12 17:25:53.287 Layout[12135:607] (null),-[ViewController viewDidAppear:]


```
	
### 其他论证：	
> 查阅github上一套非官方的开源的[UIKit源码](https://github.com/BigZaphod/Chameleon)，看看UIViewController的实现如何：
 
 ```
 // UIViewController.m 
 
 ...
 
 - (BOOL)isViewLoaded
{
    return (_view != nil);
}

- (UIView *)view
{
    if ([self isViewLoaded]) {
        return _view;
    } else {
        const BOOL wereEnabled = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [self loadView];
        [self viewDidLoad];
        [UIView setAnimationsEnabled:wereEnabled];
        return _view;
    }
}

 
 
 - (void)beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated
{
    if (_appearanceTransitionStack == 0 || (_appearanceTransitionStack > 0 && _viewIsAppearing != isAppearing)) {
        _appearanceTransitionStack = 1;
        _appearanceTransitionIsAnimated = animated;
        _viewIsAppearing = isAppearing;
        
        if ([self shouldAutomaticallyForwardAppearanceMethods]) {
            for (UIViewController *child in self.childViewControllers) {
                if ([child isViewLoaded] && [child.view isDescendantOfView:self.view]) {
                    [child beginAppearanceTransition:isAppearing animated:animated];
                }
            }
        }

        if (_viewIsAppearing) {

            //(view未初始化时，会掉loadView，然后调用viewDidLoad)
            [self view];    // ensures the view is loaded before viewWillAppear: happens 
            [self viewWillAppear:_appearanceTransitionIsAnimated];

        } else {
            [self viewWillDisappear:_appearanceTransitionIsAnimated];
        }
    } else {
        _appearanceTransitionStack++;
    }
}

 
 
 ```
> 可以认为其中 - (void)beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated是VC的view lifecycle的开始点[^2]。
> 可以看到在VC.view未初始化时，VC会调用loadView,并调用viewDidLoad,紧接着就会调ViewWillApprear，这两个操作应该是同一个event loop中的.


### 结论:

####UIViewContrller中viewDidLoad和viewWillAppear在同一次`event loop`中.




[^1]:  之所以说“方法名不以上述4个词语开头，`且返回后不需要retain操作,即没有strong指针指向返回值,`则其返回值是autorelease的.”是因为： 对于ARC会使用特殊函数`objc_autoReleaseReturnValue()`来代替简单的`autorelease` 以优化先autorelease再retain这种多余的操作（配合`objc_retainAutoreleaseReturnValue()`）. 详情可参见《Effective Object-C 2.0》第30条。

[^2]: 当ViewController为window.rootViewController时，ViewController的view加到window上时会调用VC的 - (void)beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated;  若VC在一个containnerController下（如NavigationController\tabbarController），则这些containnerController会在add或remove一个子VC时，调用子VC的 - (void)beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated.

