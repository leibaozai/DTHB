//
//  SLDetailViewController.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-15.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLDetailViewController.h"

@interface SLDetailViewController ()

@end

@implementation SLDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
}

-(void)creatUI
{

    NSString *str = [_model.photoModel valueForKey:@"path"];
    
    NSString *urlStr = [[NSString alloc] init];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    if ([str hasSuffix:@"_webp"]) {
        urlStr = [str componentsSeparatedByString:@"_webp"][0];
        [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
    }else
    {
        [imageView sd_setImageWithURL:[NSURL URLWithString:[_model.photoModel valueForKey:@"path"]]];
    }
    
    [self.view addSubview:imageView];
}


@end
