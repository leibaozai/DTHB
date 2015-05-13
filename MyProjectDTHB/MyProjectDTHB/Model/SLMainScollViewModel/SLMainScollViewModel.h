//
//  SLMainScollViewModel.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLParentsModel.h"

/**
 滚动图片请求Model
 */
@interface SLMainScollViewModel : SLParentsModel

@property (nonatomic, copy) NSString *tag;   //,
@property (nonatomic, copy) NSString *enabled_at_str;   //2015-05-12 00:01:00,
@property (nonatomic, copy) NSString *date;   //2015-05-12,
@property (nonatomic, copy) NSString *target;   ///album/64836320/,
@property (nonatomic, copy) NSString *desc;   //好用的美妆护肤品,
@property (nonatomic, copy) NSString *action;   //in-web,
@property (nonatomic, copy) NSString *pic;   //http://img4q.duitang.com/uploads/people/201505/11/20150511225732_MYAPc.jpeg,
@property (nonatomic, copy) NSString *date_ts;   //1431360060

@end
