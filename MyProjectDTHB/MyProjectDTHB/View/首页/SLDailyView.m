//
//  SLDailyView.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-13.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLDailyView.h"

@implementation SLDailyView

// 纯代码手写调用的方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:(CGRect)frame];
    if (self) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI
{
    // 实例化瀑布流的Layout
    _waterfallLayout = [[CHTCollectionViewWaterfallLayout alloc] init];
    
    //距离上下间距10 左右间距5
    _waterfallLayout.sectionInset = UIEdgeInsetsMake(10.0f, 5.0f, 10.0f, 5.0f);
    
    // 设置瀑布流有几列
    _waterfallLayout.columnCount = 3;
    
    // 设置头高
    //_waterfallLayout.headerHeight = 200;
    
    //设置item间距
    _waterfallLayout.minimumColumnSpacing = 5.0f;
    _waterfallLayout.minimumInteritemSpacing = 5.0f;
    
    // 根据瀑布流的Layout来实例化ColletcionView
    _collectionView = [[UICollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:_waterfallLayout];
    //_collectionView.dataSource = self;
    //_collectionView.delegate = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    
    [self addSubview:_collectionView];
}

@end
