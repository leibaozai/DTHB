//
//  SLTemhBtnModel.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLTemhBtnModel.h"
#import "SLTemhBtnClickNumModel.h"
@implementation SLTemhBtnModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sub_cates_0 = [NSMutableArray array];
        _sub_cates_1 = [NSMutableArray array];
    }
    return self;
}

// 对应系统关键字需要做判断
-(void)setValue:(id)value forKey:(NSString *)key
{
    // 对应关键字作kvc处理
    if ([key isEqualToString:@"mall_category"]) {
        for (NSString *numStr in [value allKeys]) {
            
            SLTemhBtnClickNumModel *numModel = [[SLTemhBtnClickNumModel alloc]init];
            
            if ([numStr isEqualToString:@"0"]) {
                for (NSDictionary *dict0 in [value objectForKey:@"0"]) {
                    [numModel setValuesForKeysWithDictionary:dict0];
                    [_sub_cates_0 addObject:numModel];
                }
            }else if ([numStr isEqualToString:@"1"]) {
                for (NSDictionary *dict1 in [value objectForKey:@"1"]) {
                    [numModel setValuesForKeysWithDictionary:dict1];
                    [_sub_cates_0 addObject:numModel];
                }
            }
        }
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end
