//
//  SLLoginViewController.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLLoginViewController.h"
#import "SLLoginOrRegistView.h"
#import "UMSocial.h"

@interface SLLoginViewController ()<UMSocialUIDelegate>
{
    SLLoginOrRegistView *loginView;
}
@end

@implementation SLLoginViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self creatUI];
    
}

-(void)creatUI
{
    loginView = [[NSBundle mainBundle] loadNibNamed:@"SLLoginOrRegistView" owner:self options:nil][0];
    
    loginView.frame = self.view.bounds;
    
    __block SLLoginViewController *loginVC = self;
    loginView.senderBlock = ^(id sender)
    {
        [loginVC buttonClick:sender];
    };
    
    [self.view addSubview:loginView];
}

-(void)buttonClick:(UIView *)sender
{
    switch (sender.tag) {
        case 50:
            [self sinaAuthLogin];
            break;
            
        default:
            break;
    }

}

-(void)sinaAuthLogin
{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5556b43767e58e2817002507"
                                      shareText:@"哈哈哈，这是我的分享"
                                     shareImage:[UIImage imageNamed:@"daily_date"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,nil]
                                       delegate:self];
}

@end
