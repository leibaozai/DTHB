//
//  SLDailyView.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-13.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLParentsView.h"
#import "CHTCollectionViewWaterfallLayout.h"


@interface SLDailyView : SLParentsView

@property (nonatomic, strong) UICollectionView  *collectionView;

@property (nonatomic, strong) CHTCollectionViewWaterfallLayout *waterfallLayout;
@end
