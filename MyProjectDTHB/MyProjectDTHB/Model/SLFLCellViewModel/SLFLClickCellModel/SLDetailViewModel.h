//
//  SLDetailViewModel.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLParentsModel.h"
#import "SLAlbumModel.h"
#import "SLPhotoModel.h"
#import "SLItemModel.h"
#import "SLSenderModel.h"
/**
 最底层详细请求-所有的详情页请求-Model
 */
@interface SLDetailViewModel :NSObject

@property(nonatomic,strong) SLAlbumModel *album;
@property(nonatomic,strong) SLPhotoModel *photo;
@property(nonatomic,strong) SLItemModel *item;
@property(nonatomic,strong) SLSenderModel *sender;

@property(nonatomic, copy)NSString *msg;   //樱桃小丸子新发型手机壳iPhone4S55s苹果手机壳糖果色软壳,
@property(nonatomic, copy)NSString *id;   //363333616,

@property(nonatomic, copy)NSString *buyable;   //1,

@property(nonatomic, copy)NSString *is_root;   //0,
@property(nonatomic, copy)NSString *has_favorited;   //0,
@property(nonatomic, copy)NSString *reply_count;   //0,
@property(nonatomic, copy)NSString *source_domain;   //item.taobao.com,
@property(nonatomic, copy)NSString *source_title;   //樱桃小丸子新发型手机壳iPhone4S55s苹果手机壳糖果色软壳,
@property(nonatomic, copy)NSString *source_shortcut_icon;   //http://img4.duitang.com/uploads/misc/201411/06/20141106140440_a3ACH.png,
@property(nonatomic, copy)NSString *source_link;   //http://www.duitang.com/redirect/?to=http%3A%2F%2Fitem.taobao.com%2Fitem.htm%3Fid%3D39520285227%26spm_d%3D3&app_code=,
@property(nonatomic, copy)NSString *add_datetime;   //今天 11:12,
@property(nonatomic, copy)NSString *add_datetime_pretty;   //2小时前,
@property(nonatomic, copy)NSString *add_datetime_ts;   //1431400342,
@property(nonatomic, copy)NSString *icon_url;   //http://img4.duitang.com/uploads/files/201408/29/20140829123010_Psd4P.png,
@property(nonatomic, copy)NSString *sender_id;   //4715867,
@property(nonatomic, copy)NSString *like_id;   //0,
@property(nonatomic, copy)NSString *next_id;   //362544455,
@property(nonatomic, copy)NSString *like_count;   //0,
@property(nonatomic, copy)NSString *favorite_count;   //34,
@property(nonatomic, copy)NSString *event_count;   //34,
@property(nonatomic, copy)NSString *extra_type;   //PICTURE

#if 0
    album;   //{
        id;   //61866700,
        name;   //默认专辑,
        count;   //0,
        category;   //0,
        like_count;   //1
    },
    photo;   //{
        width;   //650,
        height;   //867,
        path;   //http://img4q.duitang.com/uploads/blog/201504/18/20150418143559_BZxF8.jpeg
    },
    item;   //{
        price;   //29.9,
        icon_url;   //http://img4.duitang.com/uploads/people/201305/03/20130503152203_iRWHH.png
    },
    sender;   //{
        id;   //4715867,
        username;   //被风吹走的夏天,
        avatar;   //http://imgq.duitang.com/uploads/people/201409/29/20140929191156_V4RRz.jpeg
    },
#endif
@end
