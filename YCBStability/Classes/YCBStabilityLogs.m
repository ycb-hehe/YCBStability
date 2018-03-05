//
//  YCBStabilityLogs.m
//  Pods
//
//  Created by ycb on 2018/3/5.
//
//

#import "YCBStabilityLogs.h"

@implementation YCBStabilityLogs

+ (NSString *)crashReason:(NSString *)reson
                  release:(NSString *)releaseLog
                 otherLog:(NSString *)otherLog
{
    NSMutableString *mutStr = [NSMutableString string];
    [mutStr appendString:@"\n/**NSAssert断言,Creash仅限于Debug模式\n"];
    [mutStr appendString:[NSString stringWithFormat:@"/**Creash原因:%@ \n",reson]];
    [mutStr appendString:[NSString stringWithFormat:@"/**Release模式下:%@",releaseLog]];
    [mutStr appendString:otherLog];
    
    return (NSString *)mutStr;
}

@end
