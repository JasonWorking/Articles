

![PonyDebugger Logo](https://github.com/square/PonyDebugger/raw/master/Documentation/Images/Logo.png)

PhonyDebugger的正确安装姿势
--------
> ps. 今天玩了一下PhonyDebugger,虽然我们在开发中UI的调试有Reveal,网络访问抓包有Charles,但多了解一个Debug工具也无碍. 功能一般,可能习惯了Reveal和Charles,觉得PD只适合玩玩,用起来还是不如前面两个好用.

PD提供的功能是在*浏览器中*:

* 实时查看或修改UI元素
* 实时查看网络访问,支持HTTPS
* 实时查看Core Data数据
* Remote Logging 

具体的Feature可以查看PD的[github](https://github.com/square/PonyDebugger)页.  　



1. Server端安装
---

###安装
中间有些访问是被墙了的,如第一步会需要下载http://storage.googleapis.com/chromium-browser-continuous/Mac/152100/devtools_frontend.zip.所以翻墙再下.[shadowsocks](https://github.com/shadowsocks/shadowsocks) + [proxychains4](https://github.com/rofl0r/proxychains-ng) 来翻墙是个不错的选择.


shell下：

```
proxychains4 curl -s https://cloud.github.com/downloads/square/PonyDebugger/bootstrap-ponyd.py | python - --ponyd-symlink=/usr/local/bin/ponyd ~/Library/PonyDebugger
```


```
source ~/Library/PonyDebugger/bin/activate
```

```
proxychains4 pip install -U -e git+https://github.com/square/PonyDebugger.git#egg=ponydebugger --allow-external pybonjour --allow-unverified pybonjour
```

```
proxychains4 ponyd update-devtools
```

###启动


shell 下: 

```
ponyd serve --listen-interface=127.0.0.1
```

然后
```
启动浏览器,访问http://localhost:9000  
```

一切正确将看到如下页面：


2. iOS客户端安装
---
这里没什么好说的,官方README说的比较清楚了,可以直接安装成功.建议使用CocoaPods安装,简单快捷还便于管理.搬运一下:

#### CocoaPods

[CocoaPods](http://cocoapods.org/) automates 3rd party dependencies in
Objective-C.

Install the ruby gem.

    $ sudo gem install cocoapods
    $ pod setup

> Depending on your Ruby installation, you may not have to run as sudo to
> install the cocoapods gem.

Create a Podfile. You must be running on iOS 5 or above.

    platform :ios, '5.0'
    pod 'PonyDebugger', '~> 0.4.3'

If you would like to use the latest version of PonyDebugger, point to the Github
repository directly.

    pod 'PonyDebugger', :git => 'https://github.com/square/PonyDebugger.git'

Install dependencies.

    $ pod install

When using CocoaPods, you must open the `.xcworkspace` file instead of the
project file when building your project.


3. iOS客户端工程中启动PDDebugger :
---

Example: 

```

// AppDelegate.m 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
#if DEBUG
    [self enablePonyDebugger];
#endif
	...
	return YES;
}



#pragma mark - PonyDebugger

- (void)enablePonyDebugger
{
#if DEBUG
    
    [MobClick setCrashReportEnabled:NO];
    
    PDDebugger *debugger = [PDDebugger defaultInstance];
    
    // Enable Network debugging, and automatically track network traffic that comes through any classes that implement either NSURLConnectionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate or NSURLSessionDataDelegate methods.
    [debugger enableNetworkTrafficDebugging];
    [debugger forwardAllNetworkTraffic];
    
    // Enable View Hierarchy debugging. This will swizzle UIView methods to monitor changes in the hierarchy
    // Choose a few UIView key paths to display as attributes of the dom nodes
    [debugger enableViewHierarchyDebugging];
    [debugger setDisplayedViewAttributeKeyPaths:@[@"frame", @"hidden", @"alpha", @"opaque", @"accessibilityLabel", @"text"]];
    
    // Connect to a specific host
    [debugger connectToURL:[NSURL URLWithString:@"ws://localhost:9000/device"]];
    // Or auto connect via bonjour discovery
    //[debugger autoConnect];
    // Or to a specific ponyd bonjour service
    //[debugger autoConnectToBonjourServiceNamed:@"MY PONY"];
    
    // Enable remote logging to the DevTools Console via PDLog()/PDLogObjects().
    [debugger enableRemoteLogging];
    
#endif/*if DEBUG*/

}


```

4. 运行App,然后刷新浏览器,一切正常将看到自己的App在浏览器中显示,如下图: 
---


点击App进去就可以开始使用PD了. 






附上PonyDebugger的[README](https://github.com/square/PonyDebugger/blob/master/README.md):




