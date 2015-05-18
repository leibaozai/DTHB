//
//  SLDailyHeaderController.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-14.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SLParentsController.h"

/**
 首页-头部-点进去
 */
@interface SLDailyHeaderController : SLParentsController
//请求数据拼接ID
@property(nonatomic, copy)NSString *album_id;

//nav的title
@property(nonatomic, copy)NSString *titleStr;
@end
