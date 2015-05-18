//
//  SLLoginOrRegistView.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLLoginOrRegistView.h"

@implementation SLLoginOrRegistView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)sinaAuthLogin:(id)sender {
    
    if (self.senderBlock) {
        self.senderBlock(sender);
    }
}
@end
