//
//  SLCHTHeaderView.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-13.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLCHTHeaderView.h"

@implementation SLCHTHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 1.f;
        [self creatUI];
    }
    return self;
}

-(void)creatUI
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.scrollView.pagingEnabled = YES;
    
    //_scrollView.backgroundColor = [UIColor colorWithRed:arc4random()%256 / 255.0f green:arc4random()%256 / 255.0f blue:arc4random()%256 / 255.0f alpha:1];
    
    //可滚动范围 5倍宽
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 5, self.scrollView.frame.size.height);
    
    [self addSubview:_scrollView];
}

@end
