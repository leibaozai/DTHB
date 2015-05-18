//
//  SLMoreView.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-15.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMoreView.h"

@implementation SLMoreView




- (IBAction)loginOrRegist:(id)sender {
    
    if (self.senderBlock) {
        self.senderBlock(sender);
    }
    
}
@end
