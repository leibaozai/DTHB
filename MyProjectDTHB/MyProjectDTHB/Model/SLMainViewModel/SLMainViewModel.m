//
//  SLMainViewModel.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMainViewModel.h"
#import "SLItemModel.h"
@implementation SLMainViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _item = [NSMutableArray array];
    }
    return self;
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    // 对应关键字作kvc处理
    if ([key isEqualToString:@"item"]){
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
