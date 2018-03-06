# YCBStability

[![CI Status](http://img.shields.io/travis/ycb-hehe/YCBStability.svg?style=flat)](https://travis-ci.org/ycb-hehe/YCBStability)
[![Version](https://img.shields.io/cocoapods/v/YCBStability.svg?style=flat)](http://cocoapods.org/pods/YCBStability)
[![License](https://img.shields.io/cocoapods/l/YCBStability.svg?style=flat)](http://cocoapods.org/pods/YCBStability)
[![Platform](https://img.shields.io/cocoapods/p/YCBStability.svg?style=flat)](http://cocoapods.org/pods/YCBStability)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## 介绍

一款提高iOS稳定性，有效防止闪退的框架

## 特效

** 稳定性: 解决常见闪退
** 无缝接入: 几乎不需要任何更改与替换现有代码
** 无侵入性: 模型无需继承自其他基类。
** 轻量: 该框架只有 2 个文件
** 多样性: 区分了Debug与Release环境

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

### NSArray

常见的 ```- (ObjectType)objectAtIndex:(NSUInteger)index``` 会引起数组越界，导致Crash

引入 YCBStability后， 你依然使用objectAtIndex </br>
在Debug模式下，依旧会Crash，但是我们加入了日志，方便追踪Crash信息 </br>
在Release模式下，我们将返回一个nil，防止Crash </br>






## 系统要求

该项目最低支持 iOS 8.0 和 Xcode 7.0。


## Author

ycb-hehe, 113005209@qq.com

## License

YCBStability is available under the MIT license. See the LICENSE file for more info.
