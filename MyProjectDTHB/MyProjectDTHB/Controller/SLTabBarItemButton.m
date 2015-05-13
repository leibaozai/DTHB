//
//  SLTabBarItemButton.m
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLTabBarItemButton.h"
#import "SLGlobalDefine.h"


@implementation SLTabBarItemButton

-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title selectedImage:(UIImage *)selectedImg unselectedImage:(UIImage *)unselectedImg
{
    if (self = [super initWithFrame:frame]) {
        // icon图片
        //_iconImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        CGFloat iconWidth = self.frame.size.width;
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(iconWidth/2 - 15, 0, 30, 30)];
        _iconImageView.image = unselectedImg;
        [self addSubview:_iconImageView];
        
        // Title Label
        CGFloat labelHeight = 21;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 49-labelHeight,iconWidth, labelHeight)];
        _titleLabel.text = title;
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_titleLabel];
        
        // 保存图片
        _selectedImg = selectedImg;
        _unselectedImg = unselectedImg;
        
        self.selected = NO;
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected
{
    if (_selected != selected) {
        
        _selected = selected;
        
        // 不同的状态，显示不同的图片和字体颜色
        if (selected) {
            _iconImageView.image = _selectedImg;
            _titleLabel.textColor = THEME_COLOR;
        }
        else {
            _iconImageView.image = _unselectedImg;
            _titleLabel.textColor = [UIColor blackColor];
        }
    }
}

@end
