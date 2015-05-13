//
//  SLFLCellViewModel.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLParentsModel.h"

/**
 分类页cell页面请求-Model
 */
@interface SLFLCellViewModel : SLParentsModel

#warning 数组
@property(nonatomic, strong)NSArray *sub_cates;  //sub_cates: [],

@property(nonatomic, copy)NSString *sp;   //,
@property(nonatomic, copy)NSString *path;   //,
@property(nonatomic, copy)NSString *short_name;   //iPhone周边,
@property(nonatomic, copy)NSString *pic;   //http://cdn.duitang.com/uploads/files/201211/20/20121120211657_EdJFP.png,
@property(nonatomic, copy)NSString *name;   //iPhone周边  Peripheral,
@property(nonatomic, copy)NSString *desc;   //武装你的iPhone，让它与众不同,
@property(nonatomic, copy)NSString *is_show_price; //0

#warning 重定义属性 id--idType
@property(nonatomic, copy)NSString *idType;   //50ab399dcdc93556f55f6486,

#warning 字典
@property(nonatomic)NSMutableArray *mall_category;
//mall_category: {
//    id;   //51affb20b9c280b2374505fe,
//    is_show_price: 1,
//    name;   //iPhone周边/市集
//},

@end
