//
//  NSObject+YCBStability.h
//  Cookies
//
//  Created by hehe on 15/10/28.
//  Copyright © 2015年 you. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YCBStability)

- (void)safeSetValue:(id)value forKey:(NSString *)key;

@end
