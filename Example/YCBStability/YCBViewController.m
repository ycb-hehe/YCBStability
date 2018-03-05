//
//  YCBViewController.m
//  YCBStability
//
//  Created by ycb-hehe on 03/05/2018.
//  Copyright (c) 2018 ycb-hehe. All rights reserved.
//

#import "YCBViewController.h"

#import <NSDictionary+YCBStability.h>
#import "Car"


@interface YCBViewController ()

@end

@implementation YCBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic safeSetObject:@"1" forKey:@"1"];
    
    Car *car = [[Car alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
