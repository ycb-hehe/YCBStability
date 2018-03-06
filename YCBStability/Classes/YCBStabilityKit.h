//
//  YCBStabilityBest.h
//  Pods
//
//  Created by ycb on 2018/3/6.
//
//

#import <Foundation/Foundation.h>

@interface YCBNonEmpty : NSObject

/** 判断是否是非空的数组 */
+ (BOOL)isArray:(id)object;

/** 判断是否是非空的集合*/
+ (BOOL)isSet:(id)object;

/** 判断是否是非空的字符串 */
+ (BOOL)isString:(id)text;

/** 判断是否是非空的字典 */
+ (BOOL)isDictionary:(id)object;

@end


@interface NSDictionary (YCBStability)

/** 取key对应的字符串 */
- (NSString *)getStringForKey:(id)key;

/** 取key对应的数组 */
- (NSArray *)getArrayForKey:(id)key;

/** @brief 取key对应的字典 */
- (NSDictionary *)getDictinaryForKey:(id)key;

- (int)getIntForKey:(id)key;

- (float)getFloatForKey:(id)key;

- (BOOL)getBoolForKey:(id)key;

@end


