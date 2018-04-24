//
//  UIView+XCLoad.m
//  Pods-XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/4/20.
//

#import "UIView+XCLoad.h"

@implementation UIView (XCLoad)

+ (instancetype)viewFromCurrentBundleWithNibName:(NSString *)nibName
{
    /// 获取当前 Bundle
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    /// 获取 storyboard 所在的 Bundle 名称
    NSString *bundleName = currentBundle.infoDictionary[@"CFBundleName"];
    return [self viewFromCurrentBundleWithBundleName:bundleName nibName:nibName];
}

+ (instancetype)viewFromCurrentBundleWithBundleName:(NSString *)bundleName
                                            nibName:(NSString *)nibName
{
    /// 获取当前 Bundle
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    /// 获取 storyboard 所在的 Bundle 路径
    NSString *bundlePath = [currentBundle pathForResource:bundleName ofType:@"bundle"];
    /// 加载 storyboard
    NSBundle *viewBundle = [NSBundle bundleWithPath:bundlePath];
    
    return [[viewBundle loadNibNamed:nibName owner:nil options:nil] lastObject];
}


@end
