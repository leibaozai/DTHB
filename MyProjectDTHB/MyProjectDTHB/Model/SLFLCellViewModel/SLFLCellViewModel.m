//
//  SLFLCellViewModel.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLFLCellViewModel.h"
#import "SLFLCellMallCategoryModel.h"

@implementation SLFLCellViewModel

-(instancetype)init
{
    self = [super init];
    if (self) {
        //照片
        _mall_category = [NSMutableArray array];
        _sub_cates = [NSArray array];
    }
    return self;
}

// 对应系统关键字需要做判断
-(void)setValue:(id)value forKey:(NSString *)key
{
    // 对应系统关键字需要做判断
//    if ([key isEqualToString:@"id"]) {
//        [self setValue:value forKey:@"idType"];
//    }
    
    //数组赋值
    if ([key isEqualToString:@"sub_cates"]) {
        self.sub_cates = value;
    }
    
    // 对应关键字作kvc处理
    if ([key isEqualToString:@"mall_category"]) {
        for (NSDictionary *valueDic in value) {
            SLFLCellMallCategoryModel *mallCategoryModel = [[SLFLCellMallCategoryModel alloc]init];
            [mallCategoryModel setValuesForKeysWithDictionary:valueDic];
            [_mall_category addObject:mallCategoryModel];
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}


@end
