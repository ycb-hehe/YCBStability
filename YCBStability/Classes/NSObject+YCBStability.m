//
//  NSObject+YCBStability.m
//  Cookies
//
//  Created by hehe on 15/10/28.
//  Copyright © 2015年 you. All rights reserved.
//

#import "NSObject+YCBStability.h"

#import "YCBNonEmptyTesting.h"

@implementation NSObject (YCBStability)

- (void)safeSetValue:(id)value forKey:(NSString *)key
{
    if (value && [YCBNonEmptyTesting isStringWithAnyText:key]) {
        [self setValue:value forKey:key];
    }
}


@end
