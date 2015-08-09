###子View在父view的外部时的点击事件处理实例


###问题
---
有两种常见的需求会需要我们去修改hitTest事件:
> 1. 扩大点击区域,即一个UIButton在屏幕上显示的大小较小,但是希望用户在点击这个UIButton周围的一定范围内时,该UIButton能响应点击事件. 
> 2. 子View在父View的外部,而子View仍然想接受点击事件. 





###先说原理
---

iOS中使用`hit-testing`来找到一个`touch`对应的view. 

![image](https://raw.githubusercontent.com/JasonWorking/Articles/master/images/hit-testing.jpg)





### 方案
---
两种需求都可以归结为hitTest事件的修改.

1. 先给出扩大UIButton点击区域的方案. 

```
// UIButton+ExtendHitTest.h 

 #import <UIKit/UIKit.h>

@interface UIButton (ExtendHitTest)
@property(nonatomic, assign) UIEdgeInsets hitTestEdgeInsets;
@end




//  UIButton+ExtendHitTest.m

 #import "UIButton+ExtendHitTest.h"
 #import <objc/runtime.h>


static NSString *const kHitTestEdgeInsetsKey;

@implementation UIButton (ExtendHitTest)
@dynamic hitTestEdgeInsets;


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.hitTestEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.hitTestEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}


 #pragma mark - Setter
-(void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = [NSValue value:&hitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &kHitTestEdgeInsetsKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

 #pragma mark - Getter
-(UIEdgeInsets)hitTestEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &kHitTestEdgeInsetsKey);
    if(value) {
        UIEdgeInsets edgeInsets; [value getValue:&edgeInsets]; return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}
@end

```




