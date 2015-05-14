//
//  SLMainViewModel.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLParentsModel.h"
#import "SLPhotoModel.h"
#import "SLItemModel.h"
/**
 主界面瀑布流请求-Model
 */
@interface SLMainViewModel :SLParentsModel

@property (nonatomic, strong) SLPhotoModel *photoModel;
@property (nonatomic, strong) SLItemModel *itemModel;

@property (nonatomic, copy) NSString *add_datetime;  //4月18日 1:53,
@property (nonatomic, copy) NSString *source_link;  //http://www.duitang.com/redirect/?app_code=arwen&to=http%3A%2F%2Fitem.taobao.com%2Fitem.htm%3Fid%3D44653182027%26spm_d%3D3,
@property (nonatomic, copy) NSString *add_datetime_pretty;  //26天前,
@property (nonatomic, copy) NSString *favorite_count;  //14,
@property (nonatomic, copy) NSString *sender_id;  //6593981,
@property (nonatomic, copy) NSString *id;  //348669447,
@property (nonatomic, copy) NSString *msg;  //百亩森林 餐具 8.3英寸平盘 西餐盘 盘子可做装饰盘挂盘 冰裂纹,
@property (nonatomic, copy) NSString *add_datetime_ts;  //1429293235,
@property (nonatomic, copy) NSString *extra_type;  //PICTURE

@end
