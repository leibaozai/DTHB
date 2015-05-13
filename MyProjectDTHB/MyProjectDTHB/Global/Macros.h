//
//  Macros.h
//  iPad
//

#import "AppDelegate.h"

// 应用程序托管
#define AppDelegateInstance	 ((AppDelegate*)([UIApplication sharedApplication].delegate))

//// 其它的宏定义
//#ifdef DEBUG
//	#define                                         LOG(...) NSLog(__VA_ARGS__)
//	#define                                         LOG_METHOD NSLog(@"%s", __func__)
//    #define                                         LOGERROR(...) NSLog(@"%@传入数据有误",__VA_ARGS__)
//#else
//	#define                                         LOG(...)
//	#define                                         LOG_METHOD
//    #define                                         LOGERROR(...) NSLog(@"%@传入数据有误",__VA_ARGS__)
//#endif

//判断系统版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
//判断是否大于 IOS7
#define IS_IOS7 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")

//判断是否是iphone5
#define IS_WIDESCREEN                              ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - (double)568 ) < __DBL_EPSILON__ )
#define IS_IPHONE                                  ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone" ] || [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPhone Simulator" ])
#define IS_IPOD                                    ( [ [ [ UIDevice currentDevice ] model ] isEqualToString: @"iPod touch" ] )
#define IS_IPHONE_5                                ( IS_IPHONE && IS_WIDESCREEN )

//判断字符串是否为空
#define IFISNIL(v)                                 (v = (v != nil) ? v : @"")
//判断NSNumber是否为空
#define IFISNILFORNUMBER(v)                        (v = (v != nil) ? v : [NSNumber numberWithInt:0])
//判断是否是字符串
#define IFISSTR(v)                                 (v = ([v isKindOfClass:[NSString class]]) ? v : [NSString stringWithFormat:@"%@",v])


//全局唯一的window
#define KEY_WINDOW  [[UIApplication sharedApplication] keyWindow]

//动态获取设备高度
#define IPHONE_HEIGHT [UIScreen mainScreen].bounds.size.height
//动态获取设备宽度
#define IPHONE_WIDTH [UIScreen mainScreen].bounds.size.width

//设置颜色
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//设置颜色与透明度
#define HEXCOLORAL(rgbValue, al) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:al]


#pragma mark --- 调整行的间距
//UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 200)];
//[label setBackgroundColor:[UIColor blackColor]];
//[label setTextColor:[UIColor whiteColor]];
//[label setNumberOfLines:0];
//
//NSString *labelText = @"可以自己按照宽高，字体大小，来计算有多少行。。然后。。。每行画一个UILabel。。高度自己可以控制把这个写一个自定义的类。 ";
//
//NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
//NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//
//[paragraphStyle setLineSpacing:LINESPACE];//调整行间距
//
//[attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
//label.attributedText = attributedString;
//[self.view addSubview:label];
//[label sizeToFit];

#define PARTNER_ID      @"2088511933544308"
#define SELLER_ACCOUNT  @"yingtehua8@sina.com"
#define PRIVATEKEY      @"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAL0M8jaJCm9bMb7PjgI0wR9+mpzWTcNTwTyYBEXmrJg3MjRVluUezDjQhQBSrgaMTeM40cz+1Nt/f1OlS/vB9PzGSF+MDty6zS0NQEEvVjUUge7PsOtbPDIEmuPppKIj4wETfavaZt7j4/kVuABDC2P1DpPRP686dJsNTkSO5qrNAgMBAAECgYApxEVy9P3gMkagQFzAcgVEvwTLp7EQeV2U1IUFKHxzOKaX11z6C77UwoTP2HRoL/E5RSFc5+QBBn8L7NYHrgdAu4L5Kl048saM53QyXJviQs7lgxDSBbo+EHDY9OJJsVRalpqKSirgBZmce/M4/tNhDxUfV5yXvxOC43JEr92UIQJBAPXbahDDMN+D0MqG1y0zPyU5bJwopXsSLIxpqp4vRmHokMxlber5HGMgSSnVQ9x9j974G1RSamqV34xwnqPzIlUCQQDE2ZPgtKd9Te19kGpmmCs64iqlkUVabAuKI8wMyx4hGZx6/EpeufFiTpF3F3YDN37JOenBefLL9UIkrOrjXI6ZAkBmpX75FKV5DG3FwNph0r2QaxM/d3DvmzziOtOzS4WVJyYdUFO+ANerQzWIs7OrgPjqXKf8YpRvf7dfyT1SshYpAkAhj0qDw6jOVwvHHWjWZtjv6AEHSxX8zXDGM0YlZDeVww0Hdp2jOqYpcWWhXRGUiNCHs+TjREwdc4m8QPKmom/5AkAYGRw6TLB/XWfEvlGLMHMmbZWMXDBdBmlIN+JK2oRjIoTryG35KlXzAHWcAq2xVhvCd6gJjz9arUmqewOLBMWn"



