//
//  SLLoginOrRegistView.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLParentsView.h"

typedef void(^SenderViewBlock)(id sender);

@interface SLLoginOrRegistView : SLParentsView

@property(nonatomic, copy) SenderViewBlock senderBlock;

- (IBAction)sinaAuthLogin:(id)sender;
@end
