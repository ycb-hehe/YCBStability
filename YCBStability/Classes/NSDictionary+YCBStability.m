//
//  NSDictionary+YCBStability.m
//  H2OKit
//
//  Created by he he on 14-3-27.
//  Copyright (c) 2014年 he he. All rights reserved.
//

#import "NSDictionary+YCBStability.h"

@implementation NSDictionary (YCBStability)

- (NSString *)getStringForKey:(id)key
{
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSString class]]) {
        return (NSString *)obj;
    } else if ([obj isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)obj stringValue];
    } else {
        return @"";
    }
}

- (NSArray *)getArrayForKey:(id)key
{
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSArray class]]) {
        return (NSArray *)obj;
    } else {
        return [NSArray array];
    }
}


- (NSDictionary *)getDictinaryForKey:(id)key
{
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSDictionary class]]) {
        return (NSDictionary *)obj;
    } else {
        return [NSDictionary dictionary];
    }
}

- (int)getIntForKey:(id)key
{
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]) {
        return  [obj intValue];
    } else {
        return 0;
    }
}

- (float)getFloatForKey:(id)key
{
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]) {
        return  [obj floatValue];
    } else {
        return 0;
    }
}

- (BOOL)getBoolForKey:(id)key
{
    id obj = [self objectForKey:key];
    
    if ([obj isKindOfClass:[NSString class]] || [obj isKindOfClass:[NSNumber class]]) {
        return  [obj boolValue];
    } else {
        return 0;
    }
}


@end


///////////////////////////////////////////////////////

@implementation NSMutableDictionary (YCBStability)

- (void)safeSetObject:(id)anObject forKey:(id <NSCopying>)aKey;
{
    if (anObject && aKey) {
        [self setObject:anObject forKey:aKey];
    }
}

@end
