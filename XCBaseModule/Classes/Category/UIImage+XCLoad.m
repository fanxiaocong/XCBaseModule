//
//  UIImage+XCLoad.m
//  Pods-XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/4/20.
//

#import "UIImage+XCLoad.h"

@implementation UIImage (XCLoad)

/**
 *  通过 Bundle 所在的目录加载图片
 *
 *  @param cls          Bundle所在的类名
 *  @param imageName    图片名称
 */
+ (UIImage *)imageWithBundleClass:(Class)cls
                        imageName:(NSString *)imageName
{
    NSBundle *currentBundle = [NSBundle bundleForClass:cls];
    NSString *bundleName = currentBundle.infoDictionary[@"CFBundleName"];
    
    return [self imageWithBundleName:bundleName bundleClass:cls imageName:imageName];
}

/**
 *  加载指定 bundle 下面的图片
 *
 *  @param bundleName   Bundle名称
 *  @param cls          Bundle所在的类名
 *  @param imageName    图片名称
 */
+ (UIImage *)imageWithBundleName:(NSString *)bundleName
                     bundleClass:(Class)cls
                       imageName:(NSString *)imageName
{
    NSInteger scale = [UIScreen mainScreen].scale;
    
    NSBundle *currentBundle = [NSBundle bundleForClass:cls];
    NSString *bName = [bundleName stringByAppendingString:@".bundle"];
    NSString *imagePath  = [currentBundle pathForResource: [NSString stringWithFormat:@"%@@%zdx", imageName, scale] ofType:@"png" inDirectory:bName];
    
    return [UIImage imageWithContentsOfFile:imagePath];
}

@end
