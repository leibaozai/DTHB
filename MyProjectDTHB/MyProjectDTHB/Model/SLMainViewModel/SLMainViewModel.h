//
//  SLMainViewModel.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLPinScollViewModel.h"

/**
 主界面瀑布流请求-Model
 */
@interface SLMainViewModel : SLPinScollViewModel

//@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *icon_url;

@property (nonatomic) NSMutableArray *item;

@end
