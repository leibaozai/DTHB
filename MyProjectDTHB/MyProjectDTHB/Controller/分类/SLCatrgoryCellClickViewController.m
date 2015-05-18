//
//  SLCatrgoryCellClickViewController.m
//  MyProjectDTHB
//
//  Created by mac on 15-5-15.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLCatrgoryCellClickViewController.h"
#import "SLDailyView.h"
#import "SLMainViewModel.h"

@interface SLCatrgoryCellClickViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, CHTCollectionViewDelegateWaterfallLayout,MJRefreshBaseViewDelegate>
{
    NSMutableArray *_dataSource;
    // 瀑布流
    SLDailyView *dailyView;
    
    //刷新
    MJRefreshHeaderView *refreshHeaderView;
    MJRefreshFooterView *refreshFooterView;
    NSInteger page;
}
@end

@implementation SLCatrgoryCellClickViewController

#pragma mark - ================= 各初始化方法
-(instancetype)init
{
    if (self = [super init]) {
        page = 1;
        _dataSource = [NSMutableArray array];
        
    }
    return self;
}

-(void)dealloc
{
    //移除观察者
    [refreshHeaderView free];
    [refreshFooterView free];
}

#pragma mark - ================= 各界面触发方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [SLUIFactory createImageBBIWithImage:[UIImage imageNamed:@"navigationbar_back_icon"] target:self action:@selector(blackViewController)];
    
    [self creatUI];
    [self getRequestDataFromNetWork];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.title = _titleStr;
    
}

#pragma mark - ================= 各点击事件的判断触发

-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - ================= 各UI界面控件创建方法
-(void)creatUI
{
    //1.用代码去做V层
    dailyView = [[SLDailyView alloc] initWithFrame:self.view.bounds];
    
    dailyView.collectionView.delegate = self;
    dailyView.collectionView.dataSource = self;
    
    [self.view addSubview:dailyView];
    
    // 注册复用的Cell
    [dailyView.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    refreshHeaderView = [[MJRefreshHeaderView alloc] initWithScrollView:dailyView.collectionView];
    refreshHeaderView.delegate = self;
    refreshFooterView = [[MJRefreshFooterView alloc] initWithScrollView:dailyView.collectionView];
    refreshFooterView.delegate = self;
}

#pragma mark - ================= 触发请求方法

- (void)getRequestDataFromNetWork
{
    
        
    [AFRequestTools afGetRequestWithURL:[NSString stringWithFormat:kFLClickCellUrl,_idType,page] withParameters:nil withSuccessBlock:^(id responseObject) {
        
        if ([[responseObject[@"status"] stringValue] isEqualToString:@"1"]) {
            
            for (NSDictionary *dict in [responseObject[@"data"] valueForKey:@"object_list"]) {
                SLMainViewModel *mainViewModel = [[SLMainViewModel alloc]init];
                [mainViewModel setValuesForKeysWithDictionary:dict];
                [_dataSource addObject:mainViewModel];
            }
            [dailyView.collectionView reloadData];
            
            //判断是否正在刷新
            if ([refreshHeaderView isRefreshing])
            {
                //停止刷新
                [refreshHeaderView endRefreshing];
                //NSLog(@"停止刷新");
            }
            if ([refreshFooterView isRefreshing])
            {
                [refreshFooterView endRefreshing];
                //NSLog(@"停止加载更多");
            }
        }
    } andFailBlock:^(id responseObject) {
        // FailBlock
        ;
    }];
}

#pragma mark - ================= 各协议事件的判断触发
#pragma mark -MJRefreshBaseViewDelegate
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    //刷新
    if (refreshView == refreshHeaderView)
    {
        //NSLog(@"开始刷新");
        //《1》删除原来数据
        if (_dataSource.count > 0)
        {
            [_dataSource removeAllObjects];
        }
        //《2》page=1
        page = 1;
        //《3》重新请求服务器数据
        [self getRequestDataFromNetWork];
    }
    else //加载更多
    {
        NSLog(@"加载更多");
        //《1》page++；
        page++;
        //《2》请求服务器数据
        [self getRequestDataFromNetWork];
    }
}

#pragma mark - UICollectionViewDataSource

// 在某个分组下的Item数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataSource.count;
}

// 定制对应的Cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.frame = CGRectMake(0, 0, CGRectGetWidth(cell.frame), CGRectGetHeight(cell.frame));
    
    if ([_dataSource count]) {
        SLMainViewModel *model = _dataSource[indexPath.row];
        
        NSString *str = [model.photoModel valueForKey:@"path"];
        
        NSString *urlStr = [[NSString alloc] init];
        if ([str hasSuffix:@"_webp"]) {
            urlStr = [str componentsSeparatedByString:@"_webp"][0];
            [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr]];
        }else
        {
            [imageView sd_setImageWithURL:[NSURL URLWithString:[model.photoModel valueForKey:@"path"]]];
        }
        
        cell.backgroundView = imageView;
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout

//item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_dataSource count]) {
        SLMainViewModel *model = _dataSource[indexPath.row];
        
        //NSString *str = [model.photoModel valueForKey:@"path"];
        
        NSInteger height = [[model.photoModel valueForKey:@"height"] integerValue];
        NSInteger width = [[model.photoModel valueForKey:@"width"] integerValue];
        
        return CGSizeMake(width/100.0f, height/100.0f);
    }else
    {
        return CGSizeMake(100, arc4random() % 200 + 100);
    }
    
}

// 点击Item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%ld",indexPath.row);
}

@end
