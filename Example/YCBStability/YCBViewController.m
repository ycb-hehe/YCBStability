//
//  YCBViewController.m
//  YCBStability
//
//  Created by ycb-hehe on 03/05/2018.
//  Copyright (c) 2018 ycb-hehe. All rights reserved.
//

#import "YCBViewController.h"

#import "YCBStability.h"

@interface YCBViewController ()

@end

@implementation YCBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Release不会闪退
    //Debug会有提示
//    [self crashTesting];
    
    [self noneTesting];
    
    [self dicObjectTesting];
}

- (void)crashTesting
{
    NSArray *arr =  @[@"1",@"2"];
    //NSString *str = [arr objectAtIndex:3];
    
    
    NSMutableArray *mutArr =  [NSMutableArray array];
    //[mutArr addObject:nil];
    
    
    NSMutableSet *mutset = [[NSMutableSet alloc] init];
    //[mutset addObject:nil];
    
    NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
    //[mutDic setObject:@"3" forKey:nil];
    //[mutDic setObject:nil   forKey:@"1"];
}

- (void)noneTesting
{
    //判断非空 count>0 & class
    NSArray *arr = [NSArray array];
    if ([YCBNonEmpty isArray:arr]) {
        NSLog(@"是一个非空数组");
    }
    
    NSSet *set = [NSSet setWithObject:@"1"];
    if ([YCBNonEmpty isSet:set]) {
        NSLog(@"是一个非空集合");
    }
    
    NSDictionary *dic = nil;
    if ([YCBNonEmpty isDictionary:dic]) {
        NSLog(@"是一个非空字典");
    }
    
    NSString *str1 = @"111111";
    if ([YCBNonEmpty isString:str1]) {
        NSLog(@"str1是一个非空字符串");
    }
    
    NSString *str2 = @"";
    if ([YCBNonEmpty isString:str2]) {
        NSLog(@"str2是一个非空字符串");
    }

    NSString *str3 = nil;
    if ([YCBNonEmpty isString:str3]) {
        NSLog(@"str3是一个非空字符串");
    }
}

- (void)dicObjectTesting
{
    NSDictionary *datas = @{
                            @"item0": @"100",
                            @"item1": @"10.2",
                            @"item2": @(YES),
                            @"item3": @{@"k":@"v"},
                            @"item4": @[@"i1",@"i2",@"i3"]
                          };
    
    
    NSString *str = [datas getStringForKey:@"item0"];
    float flot = [datas getFloatForKey:@"item1"];
    BOOL isOk = [datas getBoolForKey:@"item2"];
    NSDictionary *dic = [datas getDictinaryForKey:@"item3"];
    NSArray *arr = [datas getArrayForKey:@"item4"];
    
    NSLog(@"%@, %f, %d, %@, %@",str, flot, isOk, dic, arr);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
