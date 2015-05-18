//
//  SLSettingViewController.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLSettingViewController.h"

@interface SLSettingViewController ()

@end

@implementation SLSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"此页面程序猿正在开发中，敬请期待。。。" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alertView show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
