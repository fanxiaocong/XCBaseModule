//
//  AppConfigure.h
//  Pods-XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/4/20.
//


/*
 *  备注：App 全局配置类(单例) 🐾
 */

#import <UIKit/UIKit.h>


@interface XCAppConfigure : NSObject


+ (instancetype)shareInstance;


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


#pragma mark - 👀 其他 👀 💤
/// 状态栏样式
@property (assign, nonatomic) UIStatusBarStyle statusBarStyle;
/// 返回按钮图片
@property (strong, nonatomic) UIImage *backImage;
/// 关闭按钮图片
@property (strong, nonatomic) UIImage *closeImage;
/// 占位图片
@property (strong, nonatomic) UIImage *placeholderImage;

/// 服务器上存储图片的文件夹的名称
@property (copy, nonatomic) NSString *imageFileName;


@end
