//
//  SLFavoriteViewController.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLFavoriteViewController.h"
#import "SLLoginViewController.h"
#import "SLMoreView.h"
@interface SLFavoriteViewController ()
{
    
    SLMoreView *moreView;
}
@end

@implementation SLFavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置/更多";
    
    [self creatUI];
}

-(void)creatUI
{
    
    moreView = [[NSBundle mainBundle] loadNibNamed:@"SLMoreView" owner:self options:nil][0];
    
    __block SLFavoriteViewController *favVC = self;
    moreView.senderBlock = ^(id sender)
    {
        [favVC buttonClick:sender];
    };
    
    [self.view addSubview:moreView];
}

-(void)buttonClick:(UIView *)sender
{
    switch (sender.tag) {
        case 40:
            [self thirdLogin];
            break;
            
        default:
            break;
    }
}

-(void)thirdLogin
{
    SLLoginViewController *loginVC = [[SLLoginViewController alloc] init];
    loginVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:loginVC animated:YES];
    
}


@end
