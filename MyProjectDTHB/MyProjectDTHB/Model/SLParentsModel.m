//
//  SLParentsModel.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLParentsModel.h"

@implementation SLParentsModel

/* 使用kvc赋值时注意的三个地方
 1.后台字段要对应，如果不对应，后台增加字段，我们就会奔溃。需要做重写forUndefinedKey:方法，如果有增加的key，不需要为他赋值
 2.系统关键字需要做判断，譬如id这个关键字
 3.NSNumber类型的判断
 */

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([[NSString stringWithFormat:@"%s",object_getClassName(self)] isEqualToString:@"_NSCFNumber"]) {
        NSNumberFormatter *numberFormat = [[NSNumberFormatter alloc]init];
        [numberFormat stringFromNumber:value];
    }

    // 对应系统关键字需要做判断
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"idType"];
    }
    
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    // OC的反射,是用的方法是object_getClassName，从类获取类名
    if (key) {
        //NSLog(@"%@没有这个%@属性", [NSString stringWithFormat:@"%s",object_getClassName(self)],key);
    }
    else
    {
        [super setValue:value forUndefinedKey:key];
    }
}

@end
