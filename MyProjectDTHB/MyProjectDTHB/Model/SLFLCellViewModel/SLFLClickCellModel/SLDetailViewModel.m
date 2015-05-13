//
//  SLDetailViewModel.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLDetailViewModel.h"
#import "SLAlbumModel.h"
#import "SLPhotoModel.h"
#import "SLItemModel.h"
#import "SLSenderModel.h"



@implementation SLDetailViewModel

-(instancetype)init
{
    if (self = [super init]) {
        _album = [NSMutableArray array];
        _photo = [NSMutableArray array];
        _item = [NSMutableArray array];
        _sender = [NSMutableArray array];
    }
    return self;
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    
    // 对应关键字作kvc处理
    if ([key isEqualToString:@"album"]) {
        for (NSDictionary *valueDic in value) {
            SLAlbumModel *albumModel = [[SLAlbumModel alloc]init];
            [albumModel setValuesForKeysWithDictionary:valueDic];
            [_album addObject:albumModel];
        }
    }
    else if ([key isEqualToString:@"photo"]){
        for (NSDictionary *valueDic in value) {
            SLPhotoModel *photModel = [[SLPhotoModel alloc]init];
            [photModel setValuesForKeysWithDictionary:valueDic];
            [_photo addObject:photModel];
        }
    }
    else if ([key isEqualToString:@"item"]){
        for (NSDictionary *valueDic in value) {
            SLItemModel *itemModel = [[SLItemModel alloc]init];
            [itemModel setValuesForKeysWithDictionary:valueDic];
            [_item addObject:itemModel];
        }
    }
    else if ([key isEqualToString:@"sender"]){
        for (NSDictionary *valueDic in value) {
            SLSenderModel *senderModel = [[SLSenderModel alloc]init];
            [senderModel setValuesForKeysWithDictionary:valueDic];
            [_sender addObject:senderModel];
        }
    }
    {
        [super setValue:value forKey:key];
    }
    
}


@end
