//
//  SLPhotoModel.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLParentsModel.h"
/**
 最底层详细请求-所有的详情页请求-photo-Model
 */
@interface SLPhotoModel : SLParentsModel

@property(nonatomic, strong) NSString *path;   //"http://cdnq.duitang.com/uploads/blog/201503/11/20150311123343_WxenC.jpeg",
@property(nonatomic, strong) NSString *height;   //660,
@property(nonatomic, strong) NSString *width;   //440

@end
