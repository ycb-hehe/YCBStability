//
//  NSDictionary+YCBStability.h
//  H2OKit
//
//  Created by he he on 14-3-27.
//  Copyright (c) 2014年 he he. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YCBStability)

/*! @brief 取key对应的字符串
 */
- (NSString *)getStringForKey:(id)key;

/*! @brief 取key对应的数组
 */
- (NSArray *)getArrayForKey:(id)key;

/*! @brief 取key对应的字典
 */
- (NSDictionary *)getDictinaryForKey:(id)key;

- (int)getIntForKey:(id)key;

- (float)getFloatForKey:(id)key;

- (BOOL)getBoolForKey:(id)key;

@end


@interface NSMutableDictionary (YCBStability)

/*! @brief 保证set不为nil
 */
- (void)safeSetObject:(id)anObject forKey:(id <NSCopying>)aKey;

@end
