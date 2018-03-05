//
//  NSMutableSet+YCBStability.h
//  CYOC
//
//  Created by hehe on 14-4-29.
//  Copyright (c) 2014年 changyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (YCBStability)

@end



@interface NSMutableSet (YCBStability)

/*! @brief 防止add:nil导致的崩溃
 */
- (void)safeAddObject:(id)obj;

@end