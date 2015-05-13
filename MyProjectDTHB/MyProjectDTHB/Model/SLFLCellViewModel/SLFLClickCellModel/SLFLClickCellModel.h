//
//  SLFLClickCellModel.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 点击分类页cell进入-Model
 */
@interface SLFLClickCellModel :NSObject


@property(nonatomic, copy)NSString *msg;  //  樱桃小丸子新发型手机壳iPhone4S55s苹果手机壳糖果色软壳,

#warning 重置属性id-->idType
@property(nonatomic, copy)NSString *id;  // 363333616,
@property(nonatomic, copy)NSString *buyable;  // 0,
@property(nonatomic, copy)NSString *source_link;  // http;  ////www.duitang.com/redirect/?to=http%3A%2F%2Fitem.taobao.com%2Fitem.htm%3Fid%3D39520285227%26spm_d%3D3&app_code=arwen,
@property(nonatomic, copy)NSString *add_datetime;  // 今天 11;  //12,
@property(nonatomic, copy)NSString *add_datetime_pretty;  // 1小时前,
@property(nonatomic, copy)NSString *add_datetime_ts;  // 1431400342,
@property(nonatomic, copy)NSString *sender_id;  // 4715867,
@property(nonatomic, copy)NSString *favorite_count;  // 25

@property(nonatomic)NSMutableArray *photo;
@property(nonatomic)NSMutableArray *item;
//photo;  // {
//    width;  // 650,
//    height;  // 867,
//    path;  // http;  ////img4q.duitang.com/uploads/blog/201504/18/20150418143559_BZxF8.jpeg_webp
//},

//@property(nonatomic, copy)NSString *price;
//@property(nonatomic, copy)NSString *icon_url;
//item;  // {
//    price;  // 29.9,
//    icon_url;  // http;  ////img4.duitang.com/uploads/people/201305/03/20130503152203_iRWHH.png
//},




@end
