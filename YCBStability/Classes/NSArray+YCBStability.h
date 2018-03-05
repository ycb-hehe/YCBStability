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
 */
- (id)safeObjectAtIndex:(NSUInteger)index;

- (NSUInteger)safeIndexOfObject:(id)anObject;

@end



@interface NSMutableArray (YCBStability)

/*! @brief 防止add或Insert:nil导致的崩溃
 */
- (void)safeAddObject:(id)anObject;

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index;

- (void)safeRemoveObjectAtIndex:(NSUInteger)index;


@end