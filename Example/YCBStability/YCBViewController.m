//
//  YCBViewController.m
//  YCBStability
//
//  Created by ycb-hehe on 03/05/2018.
//  Copyright (c) 2018 ycb-hehe. All rights reserved.
//

#import "YCBViewController.h"

#import "NSArray+YCBStability.h"

@interface YCBViewController ()

@end

@implementation YCBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *arr= @[@"1",@"2",@"3"];
    
    NSString *str = [arr safeObjectAtIndex:1];
    
    NSLog(@"%@",str);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
