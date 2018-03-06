//
//  YCBViewController.m
//  YCBStability
//
//  Created by ycb-hehe on 03/05/2018.
//  Copyright (c) 2018 ycb-hehe. All rights reserved.
//

#import "YCBViewController.h"

#import "YCBStability/YCBStability-prefix.pch"
#import "YCBStabilityKit.h"

@interface YCBViewController ()

@end

@implementation YCBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSArray *arr1 =  @[@"1",@"2"];
    
    NSArray *arr2 =  [[NSArray alloc] init];
    
    NSArray *arr3 =  [[NSArray alloc] initWithObjects:@"1",nil];
    
    NSArray *arr4 =  [NSArray alloc];
    
    NSMutableArray *arr5 =  [NSMutableArray array];
    
    
    NSMutableSet *mutset = [[NSMutableSet alloc] init];
    
    [mutset addObject:@"1"];
    
    [mutset  addObject:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
