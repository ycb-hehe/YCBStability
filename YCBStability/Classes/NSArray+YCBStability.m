//
//  NSArray+YCBStability.m
//  H2OKit
//
//  Created by he he on 14-3-27.
//  Copyright (c) 2014年 he he. All rights reserved.
//

#import "NSArray+YCBStability.h"
#import <objc/runtime.h>
#import "YCBStabilityLogs.h"

@implementation NSArray (YCBStability)

+ (void)load
{
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(safeObjectAtIndex:));
    method_exchangeImplementations(fromMethod, toMethod);
    
    Method fromMethod2 = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(indexOfObject:));
    Method toMethod2 = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(safeIndexOfObject:));
    method_exchangeImplementations(fromMethod2, toMethod2);
}

- (id)safeObjectAtIndex:(NSUInteger)index
{
    NSAssert((index < self.count),([YCBStabilityLogs crashReason:@"数组越界"
                                                         release:@"返回nil"
                                                        otherLog:[NSString stringWithFormat:@"数组Count:%@ 参数下标index:%@",@(self.count),@(index)]]));
                                    
    if (index < self.count){
        return [self safeObjectAtIndex:index];
    }else{
        return nil;
    }
}

- (NSUInteger)safeIndexOfObject:(id)anObject
{
    NSAssert((anObject && [self containsObject:anObject]), @"元素不存在,release返回0");
    if (anObject && [self containsObject:anObject]) {
        return [self safeIndexOfObject:anObject];
    } else {
        return 0;
    }
}

@end

///////////////////////////////////////////////////////////


@implementation NSMutableArray (YCBStability)

+ (void)load
{
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(addObject:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeAddObject:));
    method_exchangeImplementations(fromMethod, toMethod);

    Method fromMethod2 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(insertObject:atIndex:));
    Method toMethod2 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeInsertObject:atIndex:));
    method_exchangeImplementations(fromMethod2, toMethod2);

    Method fromMethod3 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(removeObjectAtIndex:));
    Method toMethod3 = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(safeRemoveObjectAtIndex:));
    method_exchangeImplementations(fromMethod3, toMethod3);
}

- (void)safeAddObject:(id)anObject
{
    NSAssert((anObject), @"被添加的元素不存在");

    if (anObject) {
        [self safeAddObject:anObject];
    }
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    NSAssert((anObject), @"被添加的元素不存在");

    if (anObject) {
        [self safeInsertObject:anObject atIndex:index];
    }
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index
{
    NSAssert((index < self.count), @"被移除的元素index越界");

    if (index < self.count) {
        [self safeRemoveObjectAtIndex:index];
    }
}


@end
