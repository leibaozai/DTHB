//
//  SLFLCellMallCategoryModel.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLFLCellMallCategoryModel.h"

@implementation SLFLCellMallCategoryModel

-(void)setValue:(id)value forKey:(NSString *)key
{
    // 对应系统关键字需要做判断
//    if ([key isEqualToString:@"id"]) {
//        [self setValue:value forKey:@"idType"];
//    }
//    else
//    {
//        [super setValue:value forKey:key];
//    }
    [super setValue:value forKey:key];
}

@end
