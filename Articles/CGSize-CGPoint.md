### CGSize, CGPoint, CGRect 的写法
---

#### 几个结构体定义

```
// CGGeometry.h 

/* Points. */

struct CGPoint {
  CGFloat x;
  CGFloat y;
};
typedef struct CGPoint CGPoint;

/* Sizes. */

struct CGSize {
  CGFloat width;
  CGFloat height;
};
typedef struct CGSize CGSize;


/* Rectangles. */

struct CGRect {
  CGPoint origin;
  CGSize size;
};
typedef struct CGRect CGRect;
```


#### 常见写法

```
CGPoint point = CGPointMake(0, 0);
CGSize  size  = CGSizeMake(10, 20);
CGRect  rect  = CGRectMake(0, 0, 10, 20);

```

#### 但既然是普通结构体,还可以这么写:

```

CGPoint point =  {.x = 0, .y= 0};
CGSize  size = {.width = 10, .height = 10};
CGRect rect = {point, size};
CGRect rect2 = {.origin.x = 0, .origin.y = 0, .size.width = 10, .size.height = 10};
CGRect rect3 = {{.x = 0, .y = 0}, {.width = 10, .height = 10}};

```

这种写法更直观,但是没有代码补全. 两种写法的汇编代码是不一样的: 


0.测试类 ClassFoo.m
---

```
// ClassFoo.m 

- (void)testMethod2
{
    CGRect rect2 = {.origin.x = 0, .origin.y = 0, .size.width = 10, .size.height = 10};
}

- (void)testMethod3
{
    CGRect rect4 = CGRectMake(0, 0, 10, 10);
}

```



1. CGRectMake 的汇编代码( shell# clang -S ClassFoo.m -o ClassFoo.s)： 
---


*.cfi_XX 为[CFI directives](https://sourceware.org/binutils/docs/as/CFI-directives.html).* 



```

_CGRectMake:                            ## @CGRectMake
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp6:
	.cfi_def_cfa_offset 16
Ltmp7:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp8:
	.cfi_def_cfa_register %rbp
	movq	%rdi, %rax
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	%xmm2, -24(%rbp)
	movsd	%xmm3, -32(%rbp)
	movsd	-8(%rbp), %xmm0
	movsd	%xmm0, -64(%rbp)
	movsd	-16(%rbp), %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	-24(%rbp), %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	-32(%rbp), %xmm0
	movsd	%xmm0, -40(%rbp)
	movq	-64(%rbp), %rcx
	movq	%rcx, (%rdi)
	movq	-56(%rbp), %rcx
	movq	%rcx, 8(%rdi)
	movq	-48(%rbp), %rcx
	movq	%rcx, 16(%rdi)
	movq	-40(%rbp), %rcx
	movq	%rcx, 24(%rdi)
	popq	%rbp
	retq
	.cfi_endproc

```

2. testMethod3（使用CGRectMake） 的汇编代码： 
---

```
"-[classFoo testMethod3]":              ## @"\01-[classFoo testMethod3]"
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp12:
	.cfi_def_cfa_offset 16
Ltmp13:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp14:
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	leaq	-48(%rbp), %rax
	xorps	%xmm0, %xmm0
	movsd	LCPI4_0(%rip), %xmm1
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rax, %rdi
	movsd	%xmm0, -56(%rbp)        ## 8-byte Spill
	movsd	-56(%rbp), %xmm2        ## 8-byte Reload
	movsd	%xmm1, -64(%rbp)        ## 8-byte Spill
	movaps	%xmm2, %xmm1
	movsd	-64(%rbp), %xmm2        ## 8-byte Reload
	movsd	-64(%rbp), %xmm3        ## 8-byte Reload
	callq	_CGRectMake   // 在这里调用_CGRectMake
	addq	$64, %rsp 
	popq	%rbp
	retq
	.cfi_endproc
```

3.  `CGRect rect2 = {.origin.x = 0, .origin.y = 0, .size.width = 10, .size.height = 10};` 的汇编代码：
---

```
"-[classFoo testMethod2]":              ## @"\01-[classFoo testMethod2]"
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp9:
	.cfi_def_cfa_offset 16
Ltmp10:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp11:
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	"-[classFoo testMethod2].rect2"(%rip), %rsi
	movq	%rsi, -48(%rbp)
	movq	"-[classFoo testMethod2].rect2"+8(%rip), %rsi
	movq	%rsi, -40(%rbp)
	movq	"-[classFoo testMethod2].rect2"+16(%rip), %rsi
	movq	%rsi, -32(%rbp)
	movq	"-[classFoo testMethod2].rect2"+24(%rip), %rsi
	movq	%rsi, -24(%rbp)
	popq	%rbp
	retq
	.cfi_endproc

```


####可以看到直接使用`{.origin.x = 0, .origin.y = 0, .size.width = 10, .size.height = 10}`虽然代码写起来会更繁琐，但是机器处理起来会更直接. 





