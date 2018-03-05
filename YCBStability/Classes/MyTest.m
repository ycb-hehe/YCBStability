//
//  MyTest.m
//  MyDemo
//
//  Created by ycb on 2018/3/5.
//  Copyright © 2018年 ycb. All rights reserved.
//

#import "MyTest.h"
#import "NSArray+YCBStability.h"

@implementation MyTest
+ (void)doTesting
{
    NSArray *arr = @[@"1",@"2",@"3",@"4"];
    NSString *str = [arr objectAtIndex:30];
    NSLog(@"%@",str);
    
    NSInteger idx = [arr indexOfObject:@"5"];
}
@end
