//
//  NSArray+YCBStability.m
//  H2OKit
//
//  Created by he he on 14-3-27.
//  Copyright (c) 2014年 he he. All rights reserved.
//

#import "NSArray+YCBStability.h"

@implementation NSArray (YCBStability)

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index < self.count){
        return [self objectAtIndex:index];
    }else{
        return nil;
    }
}

- (NSUInteger)safeIndexOfObject:(id)anObject
{
    if (anObject && [self containsObject:anObject]) {
        return [self indexOfObject:anObject];
    } else {
        return 0;
    }
}

@end

///////////////////////////////////////////////////////////


@implementation NSMutableArray (YCBStability)

- (void)safeAddObject:(id)anObject
{
    if (anObject) {
        [self addObject:anObject];
    }
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject) {
        [self insertObject:anObject atIndex:index];
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    }
}


@end