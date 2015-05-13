//
//  SLTemhBtnModel.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 特卖会按钮请求-Model
 */
@interface SLTemhBtnModel : NSObject

@property(nonatomic)NSMutableArray *sub_cates_0;
@property(nonatomic)NSMutableArray *sub_cates_1;

@property(nonatomic, copy)NSString *short_name;  //特卖惠,
@property(nonatomic, copy)NSString *pic;  //http://img4.duitang.com/uploads/people/201202/08/20120208203626_HjvLV.jpg,
@property(nonatomic, copy)NSString *id;  //temaihui,
@property(nonatomic, copy)NSString *is_show_price;  //1,
@property(nonatomic, copy)NSString *name;  //特卖惠

@end
