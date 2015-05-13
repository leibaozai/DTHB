//
//  SLTabBarItemButton.h
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 自定的TabbarItem
 */
@interface SLTabBarItemButton : UIView
{
    UIImageView *_iconImageView;
    UILabel     *_titleLabel;
    
    UIImage     *_selectedImg;
    UIImage     *_unselectedImg;
}

@property (nonatomic, assign) BOOL  selected;

- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                selectedImage:(UIImage *)selectedImg
              unselectedImage:(UIImage *)unselectedImg;


#if 0
- (instancetype)initWithFrame:(CGRect)frame
                        title:(NSString *)title
                selectedImage:(UIImage *)selectedImg
            selectedTintColor:(UIColor *)selectedTintColor
              unselectedImage:(UIImage *)unselectedImg
          unselectedTintColor:(UIColor *)unselectedTintColor;
#endif
@end
