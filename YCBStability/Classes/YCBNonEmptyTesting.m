//
//  YCBNonEmptyTesting.m
//  YCBKit
//
//  Created by hehe on 3/10/15.
//  Copyright (c) 2015 cy. All rights reserved.
//

#import "YCBNonEmptyTesting.h"

@implementation YCBNonEmptyTesting


+ (BOOL)isArrayWithObjects:(id)object
{
    return [object isKindOfClass:[NSArray class]] && [(NSArray*)object count] > 0;
}

+ (BOOL)isSetWithObjects:(id)object
{
    
    return [object isKindOfClass:[NSSet class]] && [(NSSet*)object count] > 0;
}

+ (BOOL)isDictionaryWithObject:(id)object
{
    return [object isKindOfClass:[NSDictionary class]] && [(NSDictionary *)object count] >0;
}

+ (BOOL)isStringWithAnyText:(id)text
{    
    return [text isKindOfClass:[NSString class]] && [(NSString*)text length] > 0;
}

- (void)doTesting
{
    
}

@end
