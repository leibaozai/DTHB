//
//  SLCategoryTableViewCell.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-15.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLCategoryTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation SLCategoryTableViewCell

-(void)reloadCategoryCell:(SLFLCellViewModel *)model
{
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    _titleLable.text = model.name;
    _detailLable.text = model.desc;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



@end
