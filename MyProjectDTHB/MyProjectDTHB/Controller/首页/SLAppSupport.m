//
//  SLAppSupport.m
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLAppSupport.h"
#import "SLDailyViewController.h"
#import "SLCategoryViewController.h"
#import "SLFavoriteViewController.h"
#import "SLMoreViewController.h"
#import "SLNavigationController.h"
#import "SLTabBarItemButton.h"
#import "SLTabBarViewController.h"
#import "SLAddress.h"
#import "SLUIFactory.h"

@implementation SLAppSupport

/**
 单例，只能实例化一次
 */
+(instancetype)instance
{
    static SLAppSupport *_appSupport;
    static dispatch_once_t tocken;
    dispatch_once(&tocken, ^{
        _appSupport = [[SLAppSupport alloc] init];
    });
    
    return _appSupport;
}

-(instancetype)init
{
    if (self = [super init]) {
        
        // 拿到AppDelegate中的Window
        _appWindow = [[[UIApplication sharedApplication] delegate] window];
    }
    return self;
}

-(void)load
{
    [self createTabbarController];
}

/**
 初始化TabbarContrller
 */
-(void)createTabbarController
{

    // 初始化四个界面控制器
    SLDailyViewController *dailyVC = [[SLDailyViewController alloc] init];
    SLCategoryViewController *categoryVC = [[SLCategoryViewController alloc] init];
    SLFavoriteViewController *favoriteVC = [[SLFavoriteViewController alloc] init];
    SLMoreViewController *moreVC = [[SLMoreViewController alloc] init];
    
//    SLDailyViewController *dailyVC = [[SLDailyViewController alloc] initWithNibName:@"SLDailyViewController" bundle:nil];
//    SLCategoryViewController *categoryVC = [[SLCategoryViewController alloc] initWithNibName:@"SLCategoryViewController" bundle:nil];
//    SLFavoriteViewController *favoriteVC = [[SLFavoriteViewController alloc] initWithNibName:@"SLFavoriteViewController" bundle:nil];
//    SLMoreViewController *moreVC = [[SLMoreViewController alloc] initWithNibName:@"SLMoreViewController" bundle:nil];
    
    NSArray *vcs = @[dailyVC,categoryVC,favoriteVC,moreVC];
    
    //图片
    NSArray *imageNames = @[@"daohang_sell01",@"daohang_buy01",@"daohang_wo01",@"daohang_gengduo01"];
    
    //选中图片
    NSArray *selectedImageNames = @[@"daohang_sell02",@"daohang_buy02",@"daohang_wo02",@"daohang_gengduo02"];
    
    //标题
    NSArray *tabbarItemTitles = @[@"首页",@"分类",@"我",@"更多"];
    
    NSMutableArray *navs = [NSMutableArray arrayWithCapacity:vcs.count];
    
    for (NSInteger i=0; i<vcs.count; i++) {
        //依次取出分页控制器
        UIViewController *vc = vcs[i];
        
        // 添加NavigationController
        SLNavigationController *nav = [[SLNavigationController alloc] initWithRootViewController:vc];
        
        nav.navigationBar.barTintColor = [UIColor whiteColor];
        // 设置tabBar图片
        nav.tabBarItem.image = [UIImage imageNamed:imageNames[i]];
        nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageNames[i]];
        nav.tabBarItem.title = tabbarItemTitles[i];
        
        //
        nav.view.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight;
        
        [navs addObject:nav];
    }
    
    // 实例化TabbarController,并设置为Window的RootViewController
   SLTabBarViewController *tabbarVC = [[SLTabBarViewController alloc] init];
    tabbarVC.viewControllers = navs;
    
    _appWindow.rootViewController = tabbarVC;
    
}


@end
