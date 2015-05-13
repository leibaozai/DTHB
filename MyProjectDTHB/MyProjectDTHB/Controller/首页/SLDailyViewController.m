//
//  SLDailyViewController.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLDailyViewController.h"
#import "SLDailyView.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "SLCHTHeaderView.h"

#define kCollectionHearderReuseID @"Header"

@interface SLDailyViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, CHTCollectionViewDelegateWaterfallLayout>

@end

@implementation SLDailyViewController

#pragma mark - ================= 各初始化方法

// 纯代码手写调用的方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self creatData];
        [self creatUI];
    }
    return self;
}

//storyboard以及xib会调用的方法
//-(void)awakeFromNib
//{
//    [self creatData];
//    [self creatUI];
//}

- (void)creatData
{
    
}


#pragma mark - ================= 各界面触发方法
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"堆糖画报";
    //self.navigationItem.titleView = [SLUIFactory createTitleBBIWithTitle:@"堆糖画报" titleFont:[UIFont systemFontOfSize:20] titleColor:[UIColor redColor]];
}


#pragma mark - ================= 各UI界面控件创建方法
- (void)creatUI
{
     //1.用代码去做V层
    SLDailyView *dailyView = [[SLDailyView alloc] initWithFrame:self.view.bounds];
    
//    dailyView.senderBlock = ^(id sender)
//    {
//        [self buttonClick:sender];
//    };
    dailyView.collectionView.delegate = self;
    dailyView.collectionView.dataSource = self;
    
    [self.view addSubview:dailyView];
    
    // 注册复用的Cell
    [dailyView.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    // 注册复用的CHT组头（段头）
    [dailyView.collectionView registerClass:[SLCHTHeaderView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:kCollectionHearderReuseID];
}

#pragma mark - ================= 各点击事件的判断触发

- (void)buttonClick:(UIView *)sender
{
    switch (sender.tag) {
        case 1001:
        {
            [self.navigationController pushViewController:[UIViewController alloc] animated:YES];
        }
            break;
        case 1002:
        {
            // 点击触发请求
            //[self getRequestType:KMainMenuDetailTabbarRequestType];
        }
            break;
        default:
            break;
    }
}

#pragma mark - ================= 触发请求方法

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

// 定制组 头/尾
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    // 复用自定义组头
    SLCHTHeaderView *headerV = nil;

    // 如果头就复用头(CHT)
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
        headerV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kCollectionHearderReuseID forIndexPath:indexPath];

        headerV.backgroundColor = [UIColor redColor];
    }
    return headerV;
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
