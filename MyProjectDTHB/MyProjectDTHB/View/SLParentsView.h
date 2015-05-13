//
//  SLParentsView.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-13.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
// 全局宏定义
#import "Macros.h"
#import "SLGlobalDefine.h"
#import "SLUIFactory.h"

typedef void (^SenderViewBlock)(id sender);

/**
 父类View
 */
@interface SLParentsView : UIView

@property (nonatomic ,copy)SenderViewBlock senderBlock;
@end
