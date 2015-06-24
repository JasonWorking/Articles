### 不需要复用的代码块的写法
---



####1. 这种写法比较整洁,便于不需要复用的代码的分块. 

```
// ViewController.m 

@interface ViewController ()
@property (weak, nonatomic) UIView *anyView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

 #pragma clang diagnostic push 
 #pragma clang diagnostic ignored "-Warc-unsafe-retained-assign"
    self.anyView = ({
        UIView *view = [[UIView alloc] initWithFrame:(CGRect){{.x = 0, .y= 0},{.width = 10, .height = 20}}];
        [self.view addSubview:view];
        /**
         *  ... 一段长长的代码
         */
        view;
    });
    
    
    self.anotherView = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTintColor:UIColor.blueColor];
        [button setTitle:@"Title" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"imageNameFoo"] forState:UIControlStateNormal];
        /**
         *  ... 一段长长的代码
         */
        button;
    });
 #pragma clang diagnostic pop
}

```


####2. 这种写法的来源: GNU C 


摘自https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html :

A compound statement enclosed in parentheses may appear as an expression in GNU C. This allows you to use loops, switches, and local variables within an expression.

Recall that a compound statement is a sequence of statements surrounded by braces; in this construct, parentheses go around the braces. For example:
```
     ({ int y = foo (); int z;
        if (y > 0) z = y;
        else z = - y;
        z; })
```
is a valid (though slightly more complex than necessary) expression for the absolute value of foo ().



 
在GNU C 中, 这种写法用来定义Macro. 如果max()被定义为:

```
     #define max(a,b) ((a) > (b) ? (a) : (b))

```
则需要两次计算a和b的值,会存在副作用,如：

```
	int o1 = 1, o2 = 2;
    int c = max( o1+= 1 ,o2+=1);  // 预期c = 3, 但实际 c = 4, 因为连续计算了两次操作数b

```

如果知道两个操作数的类型,并配合使用({})这种写法,可以避免上述问题: 

```
  #define maxint(a,b) \
       ({int _a = (a), _b = (b); _a > _b ? _a : _b; })

```


 
