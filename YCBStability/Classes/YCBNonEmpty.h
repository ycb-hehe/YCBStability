//
//  YCBNonEmptyTesting.h
//  YCBKit
//
//  Created by hehe on 3/10/15.
//  Copyright (c) 2015 cy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCBNonEmpty : NSObject

/*! @brief 判断是否是非空的数组
 */
+ (BOOL)isArray:(id)object;


/*! @brief 判断是否是非空的集合
 */
+ (BOOL)isSet:(id)object;


/*! @brief 判断是否是非空的字符串
 */
+ (BOOL)isString:(id)text;


/*! @brief 判断是否是非空的字典
 */
+ (BOOL)isDictionary:(id)object;

@end
