//
//  YCBStabilityBest.h
//  Pods
//
//  Created by ycb on 2018/3/6.
//
//

#import <Foundation/Foundation.h>

/*! @auther hehe-ycb
    @email 113005209@qq.com
    @brief 一款提高iOS稳定性，有效防止闪退的框架
 */

@interface YCBNonEmpty : NSObject

/** 判断是否是非空:count+class */
+ (BOOL)isArray:(id)object;

+ (BOOL)isSet:(id)object;

+ (BOOL)isString:(id)text;

+ (BOOL)isDictionary:(id)object;

@end


@interface NSDictionary (YCBStability)

- (NSString *)getStringForKey:(id)key;

- (NSArray *)getArrayForKey:(id)key;

- (NSDictionary *)getDictinaryForKey:(id)key;

- (int)getIntForKey:(id)key;

- (float)getFloatForKey:(id)key;

- (BOOL)getBoolForKey:(id)key;

@end

/* @note
 
 NSArray,NSMutableArray,NSMutableSet,NSMutableDictionary
 常见的 - (ObjectType)objectAtIndex:(NSUInteger)index 会引起数组越界，导致Crash
 
 引入YCBStability后， 你依然使用objectAtIndex，但是会出现如下情况：
 
 Debug模式:依旧会Crash，但是我们加入了日志，方便追踪Crash信息
 
 Release模式:我们将返回一个nil，防止Crash
 
 除了引入.h文件，你不需要做任何操作，也不需要修改任何代码
 
 但如果你的代码之前有过多的在objectAtIndex加入判断，建议你去掉，保持代码的简洁性
 
 */


