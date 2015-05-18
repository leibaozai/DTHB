//
//  SLTabBarViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLTabBarViewController.h"
#import "SLGlobalDefine.h"
#import "SLTabBarItemButton.h"


@interface SLTabBarViewController ()

@property (nonatomic, assign) BOOL notFirstLoad;

@end

@implementation SLTabBarViewController

#pragma mark - Lifecycle Methods
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBar.translucent = NO;
    //self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.barTintColor = [UIColor whiteColor];
    //创建自定义tabbar
    [self createCustomizedTabbar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Helper Methods
- (void)createCustomizedTabbar
{

    //NSLog(@"%@", self.tabBar.subviews);
    if(!_notFirstLoad){
        _notFirstLoad = YES;
        
        // 把系统原来的TabbarButton移除掉
        NSArray *sysItems = self.tabBar.subviews;
        for (int i=0; i<sysItems.count; i++) {
            if ([sysItems[i] isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//                [sysItems[i] removeFromSuperview];
                [sysItems[i] setHidden:YES];
            }
        }
        
        CGFloat itemWidth = SCREEN_WIDTH / self.viewControllers.count;
        
        for (NSInteger i=0; i<self.viewControllers.count; i++) {
            // 取得对应的ViewController
            UIViewController *vc = self.viewControllers[i];
            
            SLTabBarItemButton *btn = [[SLTabBarItemButton alloc] initWithFrame:CGRectMake(i*itemWidth, 0, itemWidth, 49)title:vc.tabBarItem.title selectedImage:vc.tabBarItem.selectedImage unselectedImage:vc.tabBarItem.image];
            
            [self.tabBar addSubview:btn];
            
            // 添加点击手势
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemBtnDidClicked:)];
            btn.tag = 100+i;
            [btn addGestureRecognizer:tapGesture];
            
            // 初始化选中的按钮
            if (self.selectedIndex == i) {
                btn.selected = YES;
            }
            else {
                btn.selected = NO;
            }
        }
    }
}

#pragma mark - Event Handlers

- (void)itemBtnDidClicked:(UITapGestureRecognizer *)tapGesture
{
    SLTabBarItemButton *btn = (SLTabBarItemButton *)tapGesture.view;
    SLTabBarItemButton *srcBtn = (SLTabBarItemButton *)[self.tabBar viewWithTag:100+self.selectedIndex];
    
    // 如果当前点击的按钮不是原本选中的按钮，就进行状态的切换
    if (btn.tag != srcBtn.tag) {
        
        srcBtn.selected = NO;
        btn.selected = YES;
        
        self.selectedIndex = btn.tag - 100;
    }
}
@end
