//
//  SLAlbumModel.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLParentsModel.h"

/**
 最底层详细请求-所有的详情页请求-album-Model
 */
@interface SLAlbumModel :SLParentsModel

@property(nonatomic, copy)NSString *id;  //61866700,
@property(nonatomic, copy)NSString *name;  //默认专辑,
@property(nonatomic, copy)NSString *count;  //0,
@property(nonatomic, copy)NSString *category;  //0,
@property(nonatomic, copy)NSString *like_count;  //1

@end
