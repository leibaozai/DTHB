//
//  SLPinScollView.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLParentsModel.h"

/**
 点击滚动图片请求Model
 */
@interface SLPinScollViewModel :SLParentsModel


@property(nonatomic)NSMutableArray *photo; //照片

@property(nonatomic, copy) NSString *add_datetime;   //3月11日 12:33,
@property(nonatomic, copy) NSString *source_link;   //http://redirect.dtxn.net/dj/go2/?app_code=&to=http%3A%2F%2Fwww.mnw.cn%2Fnews%2Ffj%2F851581.html,
@property(nonatomic, copy) NSString *add_datetime_pretty;   //2个月前,
@property(nonatomic, copy) NSString *favorite_count;   //399,
@property(nonatomic, copy) NSString *sender_id;   //2281710,

#warning //更改属性关键字
@property(nonatomic, copy) NSString *idType;   //322246839,

@property(nonatomic, copy) NSString *msg;   //福建丨漳平永福号称“大陆阿里山”,今年是这里举办的第四届樱花节,此时樱花初开,红色的樱花配上周围绿色的树,分外好看。漳平市有百万株樱花竞相开放,中国红、多重樱、吉野樱、云南樱等等,这里是樱花的聚会,在寒冬中给观赏者带来了一抹春意。,
@property(nonatomic, copy) NSString *add_datetime_ts;   //1426048423,
@property(nonatomic, copy) NSString *extra_type;   //PICTURE

@end
