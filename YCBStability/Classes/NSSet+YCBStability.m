//
//  NSMutableSet+YCBStability.m
//  CYOC
//
//  Created by hehe on 14-4-29.
//  Copyright (c) 2014年 changyou. All rights reserved.
//

#import "NSSet+YCBStability.h"

@implementation NSSet (YCBStability)

@end

///////////////////////////////////////////////////////////

@implementation NSMutableSet (YCBStability)

- (void)safeAddObject:(id)obj
{
    if (obj) {
        [self addObject:obj];
    }
}

@end