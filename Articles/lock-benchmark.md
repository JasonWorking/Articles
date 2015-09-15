### 不同加锁方式耗时测试


见过有人写各种锁的耗时比较, 更喜欢相信自己的实验结论. 测一下.


1. 运行加锁和解锁操作一百万次,取平均时间,测试代码:

![image](https://raw.githubusercontent.com/JasonWorking/Articles/master/images/lock-demo.png)


模拟器上输出结果:

```

2015-09-15 22:53:53.939 test[37282:10665796] NSLock: Avg. Runtime: 63 ns
2015-09-15 22:53:54.049 test[37282:10665796] @synchronized: Avg. Runtime: 106 ns
2015-09-15 22:53:54.113 test[37282:10665796] NSCondition: Avg. Runtime: 63 ns
2015-09-15 22:53:54.277 test[37282:10665796] NSConditionLock: Avg. Runtime: 162 ns
2015-09-15 22:53:54.342 test[37282:10665796] NSRecursiveLock: Avg. Runtime: 64 ns
2015-09-15 22:53:54.355 test[37282:10665796] OSSpinLock: Avg. Runtime: 11 ns


```



iPhone6 plus上输出结果:

```


2015-09-15 22:55:56.865 test[31912:3398258] NSLock: Avg. Runtime: 184 ns
2015-09-15 22:55:57.161 test[31912:3398258] @synchronized: Avg. Runtime: 291 ns
2015-09-15 22:55:57.331 test[31912:3398258] NSCondition: Avg. Runtime: 168 ns
2015-09-15 22:55:57.776 test[31912:3398258] NSConditionLock: Avg. Runtime: 442 ns
2015-09-15 22:55:57.965 test[31912:3398258] NSRecursiveLock: Avg. Runtime: 186 ns
2015-09-15 22:55:58.005 test[31912:3398258] OSSpinLock: Avg. Runtime: 38 ns


```


大致整理一下:

| 加解锁方式   | 耗时(ns)  |
|---|---:|
| NSConditionLock	| 442	|
| @synchronized	| 291	|
| NSRecursiveLock	| 186	|
| NSLock	| 184	|
| NSCondition	| 168	|
| OSSpinLock	| 38	|





