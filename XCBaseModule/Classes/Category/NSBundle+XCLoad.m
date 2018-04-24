//
//  NSBundle+XCLoad.m
//  Pods-XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/4/20.
//

#import "NSBundle+XCLoad.h"

@implementation NSBundle (XCLoad)

+ (instancetype)bundleForClass:(Class)cls
                          name:(NSString *)name
{
    /// 获取当前 Bundle
    NSBundle *currentBundle = [NSBundle bundleForClass:cls];
    /// 获取 storyboard 所在的 Bundle 路径
    NSString *bundlePath = [currentBundle pathForResource:name ofType:@"bundle"];
    /// 加载 storyboard
    NSBundle *viewBundle = [NSBundle bundleWithPath:bundlePath];
    
    return viewBundle;
}

@end
