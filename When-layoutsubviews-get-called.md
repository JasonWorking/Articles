===

Date: 2015-05-12  
Title: 关于UIView中layoutSubviews何时被调用  
Published: true  
Type: post  

---
##关于UIView中layoutSubviews何时被调用



####1 测试环境：

1. 模拟器iOS7,模拟器iOS8,所有的layoutSubviews方法都仅仅调用[super layoutSubviews], 即 

```
- (void)layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"%s",__func__);
}

```

===
####2 视图关系:

* View0 – UIView class, root view for examples(ViewController's primary view)
* View1 – UIScrollView class, subview of View1
* View1.1 – UIView class, subview of View1 (No autoresize mask)
* View1.2 – UIView class, another subview of View1 (Autoresize mask – flexible width)


===
####3 测试结果

0. initWithFrame*不会*调用layoutSubviews.  [View0 addSubview:View1],View0和View1的layoutSubviews方法都会被调用，先View0的后View1的。




1. 当[View1 addSubview:View1.1]时， View1和View1.1的layoutSubviews方法都会被调用，先View1的后View1.1的。



2.  当[View1.1 removeFromSuperview]时， View1和View1.1的layoutSubviews方法都会被调用，先View1的后View1.1的。



3.  View1.1的bounds变化时(*不是frame*)，View1和View1.1的layoutSubviews都会被调用，先View1的后View1.1的。




4.  当View1的bounds发生变化时，调用View1和View1.2的layoutSubviews. 即：`若子view的autoresizeMask不为none时，父view的bounds变化会引起该子view的layoutSubviews被调用.`



5.  在View1已经add了View1.1后，再[View1 addSubview:View1.2],调用View1、View1.2的layoutSubviews,*并不会调用View1.1的layoutSubviews*.


6. 在layoutSubviews中改变子view的bounds（size）,`不会引起循环的layoutSubviews调用.`


7. 滑动View1调用View1的layoutSubviews. 并不调用View0的layoutSubviews.

===
####4 便于查看：

* View0 – UIView class, root view for examples(ViewController's primary view)
* View1 – UIScrollView class, subview of View1
* View1.1 – UIView class, subview of View1 (No autoresize mask)
* View1.2 – UIView class, another subview of View1 (Autoresize mask – flexible width)




|    Method    | View0 | View1 | View1.1 | View1.2 |
| ------------ | ------------- | ------------ |------------- | ------------ |
| [[View1 alloc] initWithFrame] | ✕  |✕ |✕  | ✕ |
| [View0 addSubview:View1] |  ✓  | ✓ |✕  | ✕ |
| [View1 removeFromSuperview]| ✓  | ✕ |✕  | ✕ |
| [View1 addSubview:View1.2]| ✕  | ✓ |✕  | ✓ |
| [View1.1 changeSize]| ✕  | ✓ |✓  | ✕ |
| [View1.2 changeSize]| ✕  | ✓ |✕  | ✓ |
| [View1 changeSize]| ✓  | ✕ |✕  | ✓ |
| [View1 scroll]| ✕  | ✓ |✕  | ✕ |
| change size of View1.1 in layoutSubviews of View1| ✕  | ✕ |✕  | ✕ |
| Rotate device | ✓  | ✓ |✓  | ✓ |


===


