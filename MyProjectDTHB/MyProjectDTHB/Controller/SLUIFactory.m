//
//  SLUIFactory.m
//  MyProjectFDD
//
//  Created by mac on 15-5-5.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLUIFactory.h"
#import "SLGlobalDefine.h"

@implementation SLUIFactory

//创建调整位置的BBI
+ (UIBarButtonItem *)createSpaceBBIWithWidth:(CGFloat)width
{
    UIBarButtonItem *spaceBbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceBbi.width = width;
    
    return spaceBbi;
}

//创建只有标题的BBI
+ (UIBarButtonItem *)createTitleBBIWithTitle:(NSString *)title target:(id)target action:(SEL)selector
{
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:target action:selector];
    bbi.tintColor = THEME_COLOR;
    
    return bbi;
}

/**
 创建只有标题的BBI-字体大小，颜色自定义
 */
+ (UIBarButtonItem *)createTitleBBIWithTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)color
{
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    lable.text = title;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = font;
    lable.textColor = color;
    
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithCustomView:lable];
    return bbi;
}

//创建只有图片的BBI
+(UIBarButtonItem *)createImageBBIWithImage:(UIImage *)image target:(id)target action:(SEL)selector
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 44)];
    imageView.image = image;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    //设置点击事件
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [imageView addGestureRecognizer:tapGesture];
    
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithCustomView:imageView];
    return bbi;
}

//创建返回的BBI
+ (UIBarButtonItem *)createBackBBIWithTarget:(id)target action:(SEL)selector
{
    // 创建带背景图片的按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"nav_fanhui"] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(0, 8, 25, 25)];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    // 用btn来创建自定义的BBI
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    return bbi  ;
}

/**
 创建返回的BBI数组
 */
+ (NSArray *)createBackBBIArrayWithTarget:(id)target action:(SEL)selector
{
   UIBarButtonItem *black = [self createBackBBIWithTarget:target action:selector];
    UIBarButtonItem *space = [self createSpaceBBIWithWidth:-15];
    NSArray *arr = @[space,black];
    return arr;
}

@end
