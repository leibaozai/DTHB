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
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
}

-(void)reloadHeadScrollViewWithDataArray:(NSMutableArray *)dataArr
{
    //可滚动范围
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * [dataArr count], self.scrollView.frame.size.height);
    
    for (int i=0; i<dataArr.count; i++) {
        //图片
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width * i, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        
        imageView.tag = 100 + i;
        
        //打开交互，并添加事件
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewClick:)];
        [imageView addGestureRecognizer:gesture];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:[[dataArr objectAtIndex:i] valueForKey:@"pic"]] placeholderImage:nil];
        
        //左下角lable
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(imageView.frame) - 20, CGRectGetWidth(imageView.frame), 20)];
        lable.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.4];
        lable.font = [UIFont boldSystemFontOfSize:14];
        lable.textColor = [UIColor whiteColor];
        lable.text = [NSString stringWithFormat:@"  %@",[dataArr[i] valueForKey:@"desc"]];
        [imageView addSubview:lable];
        
        //日期容器
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(imageView.frame) - 55, 0, 35, 50)];
        iv.image = [UIImage imageNamed:@"daily_date"];
        
        //取出日期date：2015-05-13 剪取13日
        NSString *dateStr = [[dataArr[i] valueForKey:@"date"] componentsSeparatedByString:@"-"][2];
        
        //星期
        UILabel *weekLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, CGRectGetWidth(iv.frame), 15)];
        weekLable.textAlignment = NSTextAlignmentCenter;
        weekLable.textColor = [UIColor whiteColor];
        weekLable.font = [UIFont boldSystemFontOfSize:14];
        weekLable.text = @"周三";
        [iv addSubview:weekLable];
        
        //日子
        UILabel *dateLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, CGRectGetWidth(iv.frame), CGRectGetHeight(iv.frame)-20)];
        dateLable.font = [UIFont boldSystemFontOfSize:22];
        dateLable.textColor = [UIColor whiteColor];
        dateLable.textAlignment = NSTextAlignmentCenter;
        dateLable.text = dateStr;
        [iv addSubview:dateLable];
        
        [imageView addSubview:iv];
        [self.scrollView addSubview:imageView];
    }

}

-(void)scrollViewClick:(id)sender
{
    if (self.senderBlock) {
        self.senderBlock(sender);
    }
}

@end
