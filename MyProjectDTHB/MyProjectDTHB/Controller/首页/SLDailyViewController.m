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
#import "SLMainScollViewModel.h"
#import "UIImageView+WebCache.h"

#import "SLDailyHeaderController.h"
#import "SLMainViewModel.h"
#import "SLPhotoModel.h"

#import "UIImage+WebP.h"

#define kCollectionHearderReuseID @"Header"

typedef enum {
    KMainScollViewRequestType = 100,
    kMainViewRequestType      = 101,
    
}RequestType;


@interface SLDailyViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, CHTCollectionViewDelegateWaterfallLayout>
{
    //滚动视图的数据源
    NSMutableArray *mainScrollViewModels;
    //瀑布流数据源
    NSMutableArray *mainViewModels;
    // 头部滚动视图
    SLCHTHeaderView *_headerV;
    
    // 瀑布流
    SLDailyView *dailyView;
}
@end

@implementation SLDailyViewController

#pragma mark - ================= 各初始化方法

// 纯代码手写调用的方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        mainScrollViewModels = [NSMutableArray array];
        mainViewModels = [NSMutableArray array];
        
//        [self creatData];
//        [self creatUI];
//        [self getRequestType:KMainScollViewRequestType];
//        [self getRequestType:kMainViewRequestType];
    }
    return self;
}

- (void)creatData
{
    
}


#pragma mark - ================= 各界面触发方法
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"堆糖画报";
    
    [self creatData];
    [self creatUI];
    [self getRequestType:KMainScollViewRequestType];
    [self getRequestType:kMainViewRequestType];

}


#pragma mark - ================= 各UI界面控件创建方法
- (void)creatUI
{
    //1.用代码去做V层
    dailyView = [[SLDailyView alloc] initWithFrame:self.view.bounds];
    
//    dailyView.senderBlock = ^(id sender)
//    {
//        [self buttonClick:sender];
//        
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

-(void)viewClick:(UITapGestureRecognizer *)gesture
{
    UIView *v = (UIView *)gesture.view;
    
    NSString *titleStr = [mainScrollViewModels[v.tag-100] valueForKey:@"desc"];
    //取出target--->/album/66856714/
    NSString *target = [mainScrollViewModels[v.tag-100] valueForKey:@"target"];
    NSString *album_id = [target componentsSeparatedByString:@"/"][2];
    
    SLDailyHeaderController *dailyVC = [[SLDailyHeaderController alloc] init];
    
    dailyVC.album_id = album_id;
    dailyVC.titleStr = titleStr;
    //NSLog(@"%@",album_id);
    dailyVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:dailyVC animated:YES];
}

- (void)buttonClick:(UIView *)sender
{
    // 利用反射获取类型名字进行判断
    if ([[NSString stringWithFormat:@"%s",object_getClassName(sender)] isEqualToString:@"UITapGestureRecognizer"]) {
        
    }
    switch (sender.tag) {
        case 100:
        {
            NSLog(@"滚动视图被点击 %ld",sender.tag);
           [self.navigationController pushViewController:[UIViewController alloc] animated:YES];
        }
            break;
        case 101:
        {
            
        }
            break;
        default:
            break;
    }
    
}

#pragma mark - ================= 触发请求方法
- (void)getRequestType:(RequestType)requestType
{
    switch (requestType) {
        case KMainScollViewRequestType:
        {
            [self mainScollViewRequest];
        }
            break;
        case kMainViewRequestType:
        {
            [self mainViewRequest];
        }
            break;
        default:
            break;
    }
}

#pragma mark -滚动视图请求数据
- (void)mainScollViewRequest
{
    [AFRequestTools afGetRequestWithURL:kMainScollView_Url withParameters:nil withSuccessBlock:^(id responseObject) {
        //NSLog(@"%@",responseObject[@"status"]);
        
        if ([[responseObject[@"status"] stringValue] isEqualToString:@"1"]) {
            // SuccessBlock
            for (NSDictionary *dict in responseObject[@"data"]) {
                SLMainScollViewModel *mainScrollViewModel = [[SLMainScollViewModel alloc]init];
                [mainScrollViewModel setValuesForKeysWithDictionary:dict];
                [mainScrollViewModels addObject:mainScrollViewModel];
            }
            [_headerV reloadHeadScrollViewWithDataArray:mainScrollViewModels];
        }
    } andFailBlock:^(id responseObject) {
        // FailBlock
        ;
    }];
}

#pragma mark -主视图瀑布流请求数据
-(void)mainViewRequest
{
    [AFRequestTools afGetRequestWithURL:[NSString stringWithFormat:kMainView_Url,1] withParameters:nil withSuccessBlock:^(id responseObject) {
        //NSLog(@"%@",[NSString stringWithFormat:kMainView_Url,1]);
        
        if ([[responseObject[@"status"] stringValue] isEqualToString:@"1"]) {
            // SuccessBlock
            NSDictionary *object_list = [[responseObject valueForKey:@"data"] valueForKey:@"object_list"];
            if (object_list) {
                for (NSDictionary *dict in object_list) {
                    SLMainViewModel *mainViewModel = [[SLMainViewModel alloc]init];
                    [mainViewModel setValuesForKeysWithDictionary:dict];
                    
                    [mainViewModels addObject:mainViewModel];
                }
            }
            //刷新-collectionView
            [dailyView.collectionView reloadData];
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
    //mainViewModels.count
    return mainViewModels.count;
}

// 定制对应的Cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.frame = CGRectMake(0, 0, CGRectGetWidth(cell.frame), CGRectGetHeight(cell.frame));
    
    if ([mainViewModels count]) {
        NSLog(@"%ld",indexPath.row);
        SLMainViewModel *model = mainViewModels[indexPath.row];
        
        NSString *str = [model.photoModel valueForKey:@"path"];
        
        NSString *urlStr = [[NSString alloc] init];
        if ([str hasSuffix:@"_webp"]) {
            urlStr = [str componentsSeparatedByString:@"_webp"][0];
            [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        }else
        {
            [imageView sd_setImageWithURL:[NSURL URLWithString:[model.photoModel valueForKey:@"path"]]];
        }

//        if ([model.photoModel valueForKey:@"path"]) {
//            NSLog(@"=====%@",[model.photoModel valueForKey:@"path"]);
//        }
        
//        [UIImage imageWithWebP:[model.photoModel valueForKey:@"path"] completionBlock:^(UIImage *result) {
//            NSLog(@"result:%@",result);
//            imageView.image = result;
//        } failureBlock:^(NSError *error) {
//             //NSLog(@"error:%@",error);
//        }];
        
        cell.backgroundView = imageView;
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}




// 定制组 头/尾
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    // 复用自定义组头
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader]) {
        _headerV = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kCollectionHearderReuseID forIndexPath:indexPath];
    }
    
    __block SLDailyViewController *dailyVC = self;
    _headerV.senderBlock = ^(id sender)
    {
        [dailyVC viewClick:sender];
    };
    
    return _headerV;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout

//item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, arc4random() % 100 + 50);
}

// 点击Item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%ld",indexPath.row);
}

//表头
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section
{
    return 200.0f;
}

#pragma mark - ================= (第三方功能区)

@end
