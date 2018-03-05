//
//  YCBNonEmptyTesting.m
//  YCBKit
//
//  Created by hehe on 3/10/15.
//  Copyright (c) 2015 cy. All rights reserved.
//

#import "YCBNonEmpty.h"

@implementation YCBNonEmpty

+ (BOOL)isArray:(id)object
{
    return [object isKindOfClass:[NSArray class]] && [(NSArray*)object count] > 0;
}

+ (BOOL)isSet:(id)object
{
    
    return [object isKindOfClass:[NSSet class]] && [(NSSet*)object count] > 0;
}

+ (BOOL)isString:(id)text
{
    return [text isKindOfClass:[NSString class]] && [(NSString*)text length] > 0;
}

+ (BOOL)isDictionary:(id)object
{
    return [object isKindOfClass:[NSDictionary class]] && [(NSDictionary *)object count] >0;
}

@end
