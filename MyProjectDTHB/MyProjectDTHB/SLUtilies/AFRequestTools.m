//
//  AFRequestTools.m
//  podTest
//
//  Created by gorson on 5/11/15.
//  Copyright (c) 2015 1000phone. All rights reserved.
//

#import "AFRequestTools.h"

@implementation AFRequestTools


+ (void)afGetRequestWithURL:(NSString *)urlString withParameters:(id)parameters withSuccessBlock:(getRequestSuccessBlock)successBlock andFailBlock:(getRequestFailBlock)failBlock;
{
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFJSONResponseSerializer serializer];
    [manger GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 成功回调方法
//        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (successBlock) {
            successBlock(responseObject);
        };
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        // 失败回调方法
        if (failBlock) {
            failBlock(error);
        };
    }];
}

@end
