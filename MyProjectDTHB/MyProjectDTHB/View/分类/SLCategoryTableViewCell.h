//
//  SLCategoryTableViewCell.h
//  MyProjectDTHB
//
//  Created by mac on 15-5-15.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLFLCellViewModel.h"
@interface SLCategoryTableViewCell : UITableViewCell

-(void)reloadCategoryCell:(SLFLCellViewModel *)model;

@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *titleLable;
@property (strong, nonatomic) IBOutlet UILabel *detailLable;
@end
