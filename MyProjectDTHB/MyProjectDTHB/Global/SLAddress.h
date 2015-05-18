//
//  LLCAddress.h
//  PocketKitchenGod
//
//  Created by 李超 on 14-2-16.
//  Copyright (c) 2014年 李超. All rights reserved.
//

#ifndef PocketKitchenGod_LLCAddress_h
#define PocketKitchenGod_LLCAddress_h

/**
 定义了屏幕的宽高的宏
 */
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

/**
 主题颜色
 */
#define THEME_COLOR ([UIColor colorWithRed:225/255.0f green:73/255.0f blue:0/255.0f alpha:1.0f])

//滚动图片请求()
#define kMainScollView_Url  @"http://www.duitang.com/napi/ad/banner/?count=7&adid=IAR001&types=album%2Curl"

//点击滚动图片请求（传值start页数）album_id--》kMainScollView_Url--》取出target--->/album/66856714/ 剪取66856714
//新抓包：http://www.duitang.com/napi/blog/list/by_album/?album_id=6627329&start=0&limit=50
//原始：http://www.duitang.com/napi/blog/list/by_album/?__dtac=%257B%2522_r%2522%253A%2520%2522830189%2522%257D&album_id=%@&user_id=0&limit=24&start=%@
#define kPinScollView_Url @"http://www.duitang.com/napi/blog/list/by_album/?album_id=%@&start=%ld&limit=50"

//再点进去 album_id == kMainScollView_Url里面的-target(测试值：64836320)
#define kClickScroUrl @"http://www.duitang.com/napi/blog/list/by_album/?__dtac=449819&album_id=%@&user_id=0&limit=24&start=%d"

//主界面瀑布流请求（传值start页数）
#define kMainView_Url @"http://www.duitang.com/napi/index/hot/?platform_name=iPhone&platform_version=8.1&device_name=iPhone5&app_version=1.8&limit=24&locale=zh-Hans_HK&__dtac=394342&include_fields=&start=%ld&app_code=arwen"

//主界面瀑布流请求---->点进去 (测试值:357289725)
//#define kMainView_Url @"http://www.duitang.com/napi/blog/detail/?blog_id=%@"
//最底层详细请求-所有的详情页请求（参数blog_id为kFLClickCellUrl的id）(测试值：363333616)
#define kdetailView_Url @"http://www.duitang.com/napi/blog/detail/?__dtac=830189&top_like_users_count=8&blog_id=%@&top_comments_count=3&top_forward_users_count=8"

//分类页cell页面请求
#define kFLCellView_Url @"http://www.duitang.com/napi/categories/?platform_version=8.1&app_version=1.8%20rv%3A1808&__dtac=%257B%2522_r%2522%253A%2520%2522749201%2522%257D&locale=zh-Hans_HK&platform_name=iPhone%20OS&device_name=iPhone%205&app_code=arwen"
//
#define KUpdata_URl @"http://www.duitang.com/napi/ad/banner/?types=url&count=7&adid=IAR002&__dtac=%257B%2522_r%2522%253A%2520%2522115397%2522%257D"

/*点击分类页cell进入(传值start页数)*/
//cate_key=%@-->为kFLCellView_Url-->mall_category-->id(测试值：51affb20b9c280b2374505fe)
#define kFLClickCellUrl @"http://www.duitang.com/napi/blog/list/by_category/?app_code=arwen&platform_version=8.1&app_version=1.8&cate_key=%@&limit=24&locale=zh-Hans_HK&__dtac=498277&platform_name=iPhone&start=%ld&device_name=iPhone5"

//特卖惠点击请求(category_id,全部也为temaihui，其它为获取的category_id，start为页数)(category_id= 测试值：51affb20b9c280b2374505fe,start=1)
#define kTemhClick_Url  @"http://www.duitang.com/napi/shopping/preferential/list/?__dtac=815587&category_id=%@&limit=0&start=%d"

//特卖会按钮请求（获得name和id）
#define ktemhBtn_Url @"http://www.duitang.com/napi/category/detail/?__dtac=%257B%2522_r%2522%253A%2520%2522127281%2522%257D&category_id=temaihui"

#endif
