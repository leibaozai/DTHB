//
//  SLAppSupport.h
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 应用的支撑的类，用来封装一些App启动的时候的逻辑
 */
@interface SLAppSupport : NSObject
{
    UIWindow *_appWindow;
}

+(instancetype)instance;

-(void)load;

@end
