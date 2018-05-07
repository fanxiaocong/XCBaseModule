//
//  AppConfigure.h
//  Pods-XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/4/20.
//


/*
 *  备注：App 全局配置类 🐾
 */

#import <UIKit/UIKit.h>


@interface XCAppConfigure : NSObject

+ (instancetype)shareInstance;

/// 配置 App 的全局参数
+ (void)configureApplication:(void(^)(XCAppConfigure *configure))callBack;


#pragma mark - 👀 颜色 👀 💤
/// 文字颜色
@property (strong, nonatomic) UIColor *textColor;
/// 灰色文字颜色
@property (strong, nonatomic) UIColor *grayTextColor;
/// 占位文字颜色
@property (strong, nonatomic) UIColor *placehodlerColor;
/// 导航栏标题颜色
@property (strong, nonatomic) UIColor *navigationTitleColor;
/// 导航栏背景颜色
@property (strong, nonatomic) UIColor *navigationBackgroundColor;
/// tabBarItem 文字颜色 --- 选中
@property (strong, nonatomic) UIColor *tabBarItemSelectedTitleColor;
/// 分隔线颜色
@property (strong, nonatomic) UIColor *cellSperatorColor;
/// view背景颜色
@property (strong, nonatomic) UIColor *viewBackgroundColor;


#pragma mark - 👀 字体 👀 💤
/// 一般标题
@property (strong, nonatomic) UIFont *titleFont;
/// 子标题
@property (strong, nonatomic) UIFont *subTitleFont;
/// 小号子标题
@property (strong, nonatomic) UIFont *littleSubTitleFont;
/// 导航栏标题
@property (strong, nonatomic) UIFont *navigationTitleFont;


#pragma mark - 👀 图片 👀 💤
/// 导航栏背景图片（如果设置了此参数，navigationBackgroundColor 将无效）
@property (strong, nonatomic) UIImage *navigationBackgroundImage;
/// 导航栏返回按钮图片
@property (strong, nonatomic) UIImage *backImage;
/// 导航栏关闭按钮图片
@property (strong, nonatomic) UIImage *closeImage;
/// 占位图片
@property (strong, nonatomic) UIImage *placeholderImage;


#pragma mark - 👀 其他 👀 💤
/// 状态栏样式
@property (assign, nonatomic) UIStatusBarStyle statusBarStyle;

@end
