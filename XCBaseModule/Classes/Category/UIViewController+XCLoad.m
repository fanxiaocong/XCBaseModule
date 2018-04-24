//
//  UIViewController+XCLoad.m
//  Pods-XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/4/20.
//

#import "UIViewController+XCLoad.h"

@implementation UIViewController (XCLoad)

+ (instancetype)viewcontrollerFromCurrentBundleWithStoryBoardName:(NSString *)storyBoardName
                                                 viewcontrollerID:(NSString *)viewcontrollerID
{
    /// 获取当前 Bundle
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    /// 获取 storyboard 所在的 Bundle 名称
    NSString *bundleName = currentBundle.infoDictionary[@"CFBundleName"];
    
    return [self viewcontrollerFromCurrentBundleWithBundleName:bundleName storyBoardName:storyBoardName viewcontrollerID:viewcontrollerID];
}


+ (instancetype)viewcontrollerFromCurrentBundleWithBundleName:(NSString *)bundleName
                                               storyBoardName:(NSString *)storyBoardName
                                             viewcontrollerID:(NSString *)viewcontrollerID
{
    /// 获取当前 Bundle
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    /// 获取 storyboard 所在的 Bundle 路径
    NSString *bundlePath = [currentBundle pathForResource:bundleName ofType:@"bundle"];
    /// 加载 storyboard
    NSBundle *storyboardBundle = [NSBundle bundleWithPath:bundlePath];
    
    /// 加载 storyboard 中的控制器
    return [[UIStoryboard storyboardWithName:storyBoardName
                                      bundle:storyboardBundle]
            instantiateViewControllerWithIdentifier:viewcontrollerID];
}

@end
