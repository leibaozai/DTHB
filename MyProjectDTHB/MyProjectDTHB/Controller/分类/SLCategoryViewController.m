//
//  SLCategoryViewController.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-15.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#define KCELL @"cell"

#import "SLCategoryViewController.h"
#import "SLCatrgoryView.h"
#import "SLCategoryTableViewCell.h"

#import "SLFLCellViewModel.h"
#import "SLCatrgoryCellClickViewController.h"
@interface SLCategoryViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataSource;
    
    //
    SLCatrgoryView *catrgoryView;
}
@end

@implementation SLCategoryViewController
#pragma mark - ================= 各初始化方法
-(instancetype)init
{
    self = [super init];
    if (self) {
        _dataSource = [NSMutableArray array];
    }
    return self;
}

#pragma mark - ================= 各界面触发方法
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"分类";
    
    [self creatUI];
    [self getRequestDataFromNetWork];
}

#pragma mark - ================= 各UI界面控件创建方法
-(void)creatUI
{
    catrgoryView = [[SLCatrgoryView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49)];
    catrgoryView.tableView.delegate = self;
    catrgoryView.tableView.dataSource = self;
    
    //catrgoryView.tableView.autoresizesSubviews = NO;
    catrgoryView.tableView.rowHeight = 70;
    [self.view addSubview:catrgoryView];
    
    //注册nib的cell
    [catrgoryView.tableView registerNib:[UINib nibWithNibName:@"SLCategoryTableViewCell" bundle:nil] forCellReuseIdentifier:KCELL];
}

#pragma mark - ================= 各点击事件的判断触发

#pragma mark - ================= 触发请求方法
- (void)getRequestDataFromNetWork
{
    [AFRequestTools afGetRequestWithURL:kFLCellView_Url withParameters:nil withSuccessBlock:^(id responseObject) {
        //NSLog(@"%@",responseObject[@"status"]);
        
        if ([[responseObject[@"status"] stringValue] isEqualToString:@"1"]) {
            
            for (NSDictionary *dict in [responseObject[@"data"] valueForKey:@"categories"]) {
                SLFLCellViewModel *cellModel = [[SLFLCellViewModel alloc]init];
                [cellModel setValuesForKeysWithDictionary:dict];
                [_dataSource addObject:cellModel];
            }
            [catrgoryView.tableView reloadData];
            
        }
    } andFailBlock:^(id responseObject) {
        // FailBlock
        ;
    }];
}

#pragma mark - ================= 各协议事件的判断触发
#pragma mark -
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KCELL forIndexPath:indexPath];
    
    SLFLCellViewModel *model = _dataSource[indexPath.row];
    
    //右边箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [cell reloadCategoryCell:model];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLCatrgoryCellClickViewController *cellClickVC = [[SLCatrgoryCellClickViewController alloc] init];
    //cellClickVC.hidesBottomBarWhenPushed = YES;
    
    SLFLCellViewModel *model = _dataSource[indexPath.row];
    cellClickVC.idType = model.idType;
    cellClickVC.titleStr = model.name;
    [self.navigationController pushViewController:cellClickVC animated:YES];
}

#pragma mark - ================= (第三方功能区)

@end
