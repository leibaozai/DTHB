//
//  SLMoreView.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-15.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLParentsView.h"

typedef void (^SenderViewBlock)(id sender);

@interface SLMoreView : SLParentsView

@property (nonatomic ,copy)SenderViewBlock senderBlock;

- (IBAction)loginOrRegist:(id)sender;

@end
