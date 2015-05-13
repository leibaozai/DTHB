//
//  SLPinScollView.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLPinScollViewModel.h"
#import "SLPhotoModel.h"


@implementation SLPinScollViewModel

-(instancetype)init
{
   self = [super init];
    if (self) {
        //照片
        _photo = [NSMutableArray array];
    }
    return self;
}

// 对应系统关键字需要做判断
-(void)setValue:(id)value forKey:(NSString *)key
{
    // 对应系统关键字需要做判断
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"idType"];
    }
    
    // 对应关键字作kvc处理
    if ([key isEqualToString:@"photo"]) {
        for (NSDictionary *valueDic in value) {
            SLPhotoModel *photModel = [[SLPhotoModel alloc]init];
            [photModel setValuesForKeysWithDictionary:valueDic];
            [_photo addObject:photModel];
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}




@end
