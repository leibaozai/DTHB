//
//  SLCHTHeaderView.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-13.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import "SLMainScollViewModel.h"

#import "UIImageView+WebCache.h"

typedef void (^SenderViewBlock)(id sender);
/**
 首页-定制滚动表头
 */
@interface SLCHTHeaderView : UICollectionReusableView

@property(nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic ,copy)SenderViewBlock senderBlock;
//赋值图片
- (void)reloadHeadScrollViewWithDataArray:(NSMutableArray *)dataArr;


@end
