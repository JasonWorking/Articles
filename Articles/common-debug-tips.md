##iOS 常用 lldb Xcode 调试技巧


### 1. lldb: po 

> print object 的缩写,最常用的命令,在lldb中打印一个对象. 

> 当该对象实现了 description方法时会打印description方法返回的NSString. 


> 联调Mach-O类型为`Relocatable Object File`的库时,直接打印可能会报错,将Mach-O换成`Static Library` .

> 对于基础类型,使用`p`而不是`po`;如果是打印基础类型的返回值,前面加上类型转换,如`p (BOOL)[ObjectFoo methodFooThatReturnsABoolean]`


> 附加打印时的格式:`print/<fmt>`, 如: `print/x   16`时输出`0x10`,[常用格式符](https://sourceware.org/gdb/onlinedocs/gdb/Output-Formats.html):



|格式控制符|类型|
|---|---|
|c|char *|
|s|字符串|
|x|16进制|
|c|char *|
|a|地址|


### 2. lldb: e
> 执行一个表达式,如`e [ObjectFoo excuteMethodFoo]`



### 3. lldb: 控制程序执行逻辑

|命令|操作|
|---|---|
|c|continue|
|n|thread step-inst-over|
|ni|thread step-inst-over|
|thread return |char *|

其中`thread return [-x] -- [<expr>] `和`thread return [<expr>]`在调试时非常有用,举例：

![image](https://raw.githubusercontent.com/JasonWorking/Articles/master/images/lldb-demo-1.png)

在上面断点时,lldb中输入`thread return NO`可以模拟一个返回值,其他对象类型的返回值也是同样的.如某个返回值需要复杂的操作才能获得,那么可以直接通过这种方式来mock一个返回. 


### 4. lldb: bt / bt all 
打印backtrace, 当程序crash或断在某处时,可以查看调用栈.
>  `bt`打印当前线程的调用栈.
>  
>  `bt all`打印所有线程的调用栈.  

### 5. lldb: 打印exception
> 在`objc_exception_throw`时,exception会压栈,可以$arg1寄存器来查看异常

> `(lldb) po $arg1` 打印exception对象
> 
> `(lldb) po [$arg1 name]` 打印异常名
> 
> `(lldb)po [$arg1 reason]` 打印异常原因


### 6. lldb: Chisel 

[Chisel](https://github.com/facebook/chisel)是Facebook开源的一套扩展lldb的Python库,提供简单实用的调试命令.如`pvc`:打印当前`keywindow`的所有ViewController,`pviews`:递归地输出所有当前`keywindow`的所有`view`.等等,谁用谁知道.

### 7. 更多lldb命令可以`(lldb) help `中查看. 


### 5. Xcode断点

断住某个断点时,可以通过拖动`程序执行指针`来更改代码执行顺序.如下图:

![image](https://raw.githubusercontent.com/JasonWorking/Articles/master/images/xode-debug-demo1.jpg)


### 6. 符号断点

当调试某些系统方法,或调试某个没有源码(或暂时没法儿用源码调试的)的framework时,举个例子:

A.framework  : 一个小的framework

B.framework : 一个小的framework 

Lib.framework :  使用A.framework+B.framework+C.framework+.... 链接成一个最终的库.

ApplicationDemo中使用Lib.framework. 要调试A.framework时,符号表断点就能派上用场了. 

如下图,可以配合一些`lldb指令`来调试. 

![image](https://raw.githubusercontent.com/JasonWorking/Articles/master/images/symbolic-breakpoint-demo.jpg)


