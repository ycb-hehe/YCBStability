# YCBStability

[![CI Status](http://img.shields.io/travis/ycb-hehe/YCBStability.svg?style=flat)](https://travis-ci.org/ycb-hehe/YCBStability)
[![Version](https://img.shields.io/cocoapods/v/YCBStability.svg?style=flat)](http://cocoapods.org/pods/YCBStability)
[![License](https://img.shields.io/cocoapods/l/YCBStability.svg?style=flat)](http://cocoapods.org/pods/YCBStability)
[![Platform](https://img.shields.io/cocoapods/p/YCBStability.svg?style=flat)](http://cocoapods.org/pods/YCBStability)

## 介绍

一款提高iOS稳定性，有效防止闪退的框架

## 特效

* 稳定性: 解决常见闪退
* 无缝接入: 几乎不需要任何更改与替换现有代码
* 无侵入性: 模型无需继承自其他基类。
* 轻量: 该框架只有 2 个文件
* 多样性: 区分了Debug与Release环境

## 安装

### CocoaPods

 1.在Podfile添加：
```ruby
pod 'YCBStability'
```
2. 执行 ```pod install or pod update.```
3. 导入 <YCBStability/YCBStability.h>。

### 手动安装

1. 下载 YCBStability 文件夹内的所有内容。
2. 将 YCBStability 内的源文件添加(拖放)到你的工程。
3. 导入 YCBStability.h。


## 使用

全局引入YCBStability.h

### NSArray,NSMutableArray,NSMutableSet,NSMutableDictionary

常见的 ```- (ObjectType)objectAtIndex:(NSUInteger)index``` 会引起数组越界，导致Crash

#### 只需引入YCBStability.h，不需要修改任何代码

objectAtIndex数组越界将不再闪退，mutArr在addObject:nil时也不会闪退，类似很多情况都如此

但是有效规避闪，并不利于我们调试时发现bug，所以我们做了如下优化：

Debug模式:依旧会Crash，但是我们加入了日志，方便追踪Crash信息 

Release模式:我们将返回一个nil，防止Crash

### NSDictionary

服务器返回的json数据并不可靠

例如：我严格的按着API文档开发,通过服务器返回数据获取一个好友表,然后取出第一个元素。

```
NSArray *friends = [NSDictionary objectForKey:@"friends"];
Friend *friend = [friends firstObject];
```
但是你会发现，如果服务器返回内容中friends可能是一个@“”或是空的Dictionary，

这是会出现闪退，因为@“”或是空的Dictionary并没有firstObject这个方法

为了有效避免这样的问题，我们通常会加判断

但我们建议使用YCBStability，来保证代码的健壮性

```
- (NSArray *)getArrayForKey:(id)key;
```

其它类型也会有，更多内容查看 YCBStability.h


### YCBNonEmpty

这是一个简单的非空判断方法，但足够全面

例如：
```
+ (BOOL)isArray:(id)object;
```

我们认为除了属于NSArray类，还应当满足count>0，才是一个有效的数组。



## 系统要求

该项目最低支持 iOS 8.0 和 Xcode 7.0。


## Author

ycb-hehe（宝哥）, 113005209@qq.com

## License

YCBStability is available under the MIT license. See the LICENSE file for more info.
