//
//  SLFLCellMallCategoryModel.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLParentsModel.h"
/**
 分类页cell页面请求-mall_category-Model
 */
@interface SLFLCellMallCategoryModel : SLParentsModel

@property(nonatomic, copy)NSString *idType;  //"51affb20b9c280b2374505fe",
@property(nonatomic, copy)NSString *is_show_price;  //1,
@property(nonatomic, copy)NSString *name;  //"iPhone周边/市集"

@end
