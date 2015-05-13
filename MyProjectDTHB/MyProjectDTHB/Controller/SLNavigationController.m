//
//  SLNavigationController.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLNavigationController.h"

@interface SLNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation SLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
    self.interactivePopGestureRecognizer.enabled = YES;
}

#pragma mark - UIGestureRecognizerDelegate

// 在手势的代理函数这里判断，是否要启用手势，返回YES就是启用，返回NO就是禁用
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    
    return YES;
}

@end
