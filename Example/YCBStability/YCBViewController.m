//
//  YCBViewController.m
//  YCBStability
//
//  Created by ycb-hehe on 03/05/2018.
//  Copyright (c) 2018 ycb-hehe. All rights reserved.
//

#import "YCBViewController.h"

#import "YCBStability/YCBStability-prefix.pch"
#import "NSArray+YCBStability.h"
#import "NSDictionary+YCBStability.h"
#import "MyTest.h"

@interface YCBViewController ()

@end

@implementation YCBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [MyTest doTesting];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
