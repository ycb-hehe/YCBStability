//
//  YCBStabilityLogs.h
//  Pods
//
//  Created by ycb on 2018/3/5.
//
//

#import <Foundation/Foundation.h>

@interface YCBStabilityLogs : NSObject

+ (NSString *)crashReason:(NSString *)reson
                  release:(NSString *)releaseLog
                 otherLog:(NSString *)otherLog;

@end
