//
//  SLDailyHeaderController.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-14.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLDailyHeaderController.h"
#import "SLDailyView.h"
#import "SLMainScollViewModel.h"

@interface SLDailyHeaderController ()<UICollectionViewDataSource, UICollectionViewDelegate, CHTCollectionViewDelegateWaterfallLayout>
{
    NSMutableArray *_dataSource;
}
@end

@implementation SLDailyHeaderController

#pragma mark - ================= 各初始化方法
-(instancetype)init
{
    if (self = [super init]) {
        
        _dataSource = [NSMutableArray array];
        
        [self creatUI];
        [self getRequestDataFromNetWork];
    }
    return self;
}

#pragma mark - ================= 各界面触发方法
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [SLUIFactory createImageBBIWithImage:[UIImage imageNamed:@"navigationbar_back_icon"] target:self action:@selector(blackViewController)];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = _titleStr;

}

#pragma mark - ================= 各UI界面控件创建方法
-(void)creatUI
{
    //1.用代码去做V层
    SLDailyView *dailyView = [[SLDailyView alloc] initWithFrame:self.view.bounds];
    
    dailyView.collectionView.delegate = self;
    dailyView.collectionView.dataSource = self;
    
    [self.view addSubview:dailyView];
    
    // 注册复用的Cell
    [dailyView.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

#pragma mark - ================= 各点击事件的判断触发

-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - ================= 各点击事件的判断触发

#pragma mark - ================= 触发请求方法

- (void)getRequestDataFromNetWork
{
    //kMainScollView_Url
    //[NSString stringWithFormat:kPinScollView_Url,_title,@"1"]
    [AFRequestTools afGetRequestWithURL:kMainScollView_Url withParameters:nil withSuccessBlock:^(id responseObject) {
        //NSLog(@"%@",responseObject[@"status"]);
        
        if ([[responseObject[@"status"] stringValue] isEqualToString:@"1"]) {
            // SuccessBlock
            for (NSDictionary *dict in responseObject[@"data"]) {
                SLMainScollViewModel *mainScrollViewModel = [[SLMainScollViewModel alloc]init];
                [mainScrollViewModel setValuesForKeysWithDictionary:dict];
                [_dataSource addObject:mainScrollViewModel];
            }
            //            [_headerV reloadHeadScrollViewWithDataArray:mainScrollViewModels];
        }
    } andFailBlock:^(id responseObject) {
        // FailBlock
        ;
    }];
}


#pragma mark - ================= 各协议事件的判断触发

#pragma mark - UICollectionViewDataSource

// 分组数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// 在某个分组下的Item数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

// 定制对应的Cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256 / 255.0f green:arc4random()%256 / 255.0f blue:arc4random()%256 / 255.0f alpha:1];
    
    return cell;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout

//item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, arc4random() % 200 + 50);
}

// 点击Item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%ld",indexPath.row);
}


#pragma mark - ================= (第三方功能区)

@end
