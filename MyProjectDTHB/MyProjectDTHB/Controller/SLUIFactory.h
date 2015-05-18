//
//  SLUIFactory.h
//  MyProjectFDD
//
//  Created by mac on 15-5-5.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 UI的工厂类，可以快速创建一些通用的UI控件
 */
@interface SLUIFactory : NSObject

/**
 提示框
 */
+ (void)showAlertViewWithMessage:(NSString *)message;

/*
 显示网络加载提示
 */
+ (void)showMBProgessHUD:(UIView *)superView amimated:(BOOL)amimated;
/*
 隐藏网络加载提示
 */
+ (void)hideMBProgessHUD:(UIView *)superView amimated:(BOOL)amimated;



/**
 创建调整位置的BBI
 */
+ (UIBarButtonItem *)createSpaceBBIWithWidth:(CGFloat)width;

/**
 创建只有标题的BBI
 */
+ (UIBarButtonItem *)createTitleBBIWithTitle:(NSString *)title target:(id)target action:(SEL)selector;

/**
 创建只有标题的BBI-字体大小，颜色自定义(有事件)
 */
//+ (UIBarButtonItem *)createTitleBBIWithTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)color target:(id)target action:(SEL)selector;

/**
 创建只有标题的BBI-字体大小，颜色自定义(无事件)
 */
+ (UIBarButtonItem *)createTitleBBIWithTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)color;


/**
 创建只有图片的BBI
 */
+(UIBarButtonItem *)createImageBBIWithImage:(UIImage *)image target:(id)target action:(SEL)selector;

/**
 创建返回的BBI
 */
+ (UIBarButtonItem *)createBackBBIWithTarget:(id)target action:(SEL)selector;

/**
 创建返回的BBI数组
 */
+ (NSArray *)createBackBBIArrayWithTarget:(id)target action:(SEL)selector;


@end
