//
//  SLMainViewModel.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMainViewModel.h"
#import "SLItemModel.h"
#import "SLPhotoModel.h"
@implementation SLMainViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _photoModel = [[SLPhotoModel alloc] init];
        _itemModel = [[SLItemModel alloc] init];
    }
    return self;
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    // 对应关键字作kvc处理
    if ([key isEqualToString:@"item"]){
        SLItemModel *itemModel = [[SLItemModel alloc]init];
        [itemModel setValuesForKeysWithDictionary:value];
        _itemModel = value;
//        for (NSDictionary *valueDic in value) {
//            SLItemModel *itemModel = [[SLItemModel alloc]init];
//            [itemModel setValuesForKeysWithDictionary:valueDic];
//            [_item addObject:itemModel];
//        }
    }
    if ([key isEqualToString:@"photo"]) {
    
        SLPhotoModel *photModel = [[SLPhotoModel alloc]init];
        [photModel setValuesForKeysWithDictionary:value];
        _photoModel = value;
        
    }
    else
    {
        [super setValue:value forKey:key];
    }
}

@end
