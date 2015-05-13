//
//  SLFLClickCellModel.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLFLClickCellModel.h"
//#import "SLPinScrollViewPhotoModel.h"
#import "SLPhotoModel.h"
#import "SLItemModel.h"
@implementation SLFLClickCellModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _photo = [NSMutableArray array];
        //_item = [NSMutableArray array];
    }
    return self;
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    // 对应系统关键字需要做判断
//    if ([key isEqualToString:@"id"]) {
//        [self setValue:value forKey:@"idType"];
//    }
    
    // 对应关键字作kvc处理
    if ([key isEqualToString:@"photo"]) {
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
    else
    {
        [super setValue:value forKey:key];
    }
    
}

@end
