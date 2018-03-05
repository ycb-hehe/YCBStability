//
//  NSArray+YCBStability.h
//  H2OKit
//
//  Created by he he on 14-3-27.
//  Copyright (c) 2014年 he he. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YCBStability)

/*! @brief 防止数组越界导致的崩溃
 使用方法不变,已经做了替换,Debug模式会有断言
 */

@end



@interface NSMutableArray (YCBStability)

/*! @brief 防止add或Insert:nil导致的崩溃
 使用方法不变,已经做了替换,Debug模式会有断言
 */

@end
