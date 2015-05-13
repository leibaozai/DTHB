//
//  SLItemModel.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLParentsModel.h"
/**
 最底层详细请求-所有的详情页请求-item-Model
 */
@interface SLItemModel : SLParentsModel

@property(nonatomic, strong) NSString *price;   //29.9,
@property(nonatomic, strong) NSString *icon_url;   //http://img4.duitang.com/uploads/people/201305/03/20130503152203_iRWHH.png


@end
