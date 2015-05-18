//
//  SLCatrgoryView.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-15.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLCatrgoryView.h"

@implementation SLCatrgoryView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
    }
    return self;
}

-(void)creatUI
{
    _tableView = [[UITableView alloc] initWithFrame:self.bounds];
    [self addSubview:_tableView];
}

@end
