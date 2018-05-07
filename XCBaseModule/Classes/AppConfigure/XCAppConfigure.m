//
//  AppConfigure.m
//  Pods-XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/4/20.
//

#import "XCAppConfigure.h"
#import <XCCategory/UIColor+XCExtension.h>


#define FONTSIZE(a)  [UIFont systemFontOfSize:(a)]


@implementation XCAppConfigure

static id _instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        /// 设置默认配置
        [self setupDefaultsConfigure];
    }
    
    return self;
}

/**
 *  设置默认配置
 */
- (void)setupDefaultsConfigure
{
    /// - 颜色
    self.textColor = [UIColor colorWithHexString:@"555555"];
    self.grayTextColor =  [UIColor colorWithHexString:@"888888"];
    self.placehodlerColor = [UIColor colorWithHexString:@"c6c6c6"];
    self.navigationTitleColor = [UIColor colorWithHexString:@"ffffff"];
    self.navigationBackgroundColor = [UIColor colorWithHexString:@"ff5252"];
    self.tabBarItemSelectedTitleColor = [UIColor colorWithHexString:@"ff5252"];
    self.cellSperatorColor = [UIColor colorWithHexString:@"e2e2e2"];
    self.viewBackgroundColor = [UIColor colorWithHexString:@"f3f3f3"];
    
    /// - 字体
    self.titleFont = FONTSIZE(17);
    self.subTitleFont = FONTSIZE(13);
    self.littleSubTitleFont = FONTSIZE(10);
    self.navigationTitleFont = FONTSIZE(21);
    
    /// 其他
    self.statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - 🔓 👀 Public Method 👀

/// 配置 App 的全局参数
+ (void)configureApplication:(void(^)(XCAppConfigure *configure))callBack
{
    XCAppConfigure *appConfig = [XCAppConfigure shareInstance];
    if (callBack) {
        callBack(appConfig);
    }
}

@end
