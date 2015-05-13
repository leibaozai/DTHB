//
//  AFRequestTools.h
//  podTest
//
//  Created by gorson on 5/11/15.
//  Copyright (c) 2015 1000phone. All rights reserved.
//  至少每个请求节省了3行代码


#import <UIKit/UIKit.h>
// 请求库 v2.5.3
#import "AFNetworking.h"
// 请求地址文件


typedef void (^getRequestSuccessBlock) (id responseObject);
typedef void (^getRequestFailBlock) (id responseObject);

@interface AFRequestTools : NSObject


+ (void)afGetRequestWithURL:(NSString *)urlString withParameters:(id)parameters withSuccessBlock:(getRequestSuccessBlock)successBlock andFailBlock:(getRequestFailBlock)failBlock;

@end
