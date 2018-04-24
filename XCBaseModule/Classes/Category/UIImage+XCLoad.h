//
//  UIImage+XCLoad.h
//  Pods-XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/4/20.
//

#import <UIKit/UIKit.h>

@interface UIImage (XCLoad)

/**
 *  通过 Bundle 所在的目录加载图片
 *
 *  @param cls          Bundle所在的类名
 *  @param imageName    图片名称
 */
+ (UIImage *)imageWithBundleClass:(Class)cls
                        imageName:(NSString *)imageName;


/**
 *  加载指定 bundle 下面的图片
 *
 *  @param bundleName   Bundle名称
 *  @param cls          Bundle所在的类名
 *  @param imageName    图片名称
 */
+ (UIImage *)imageWithBundleName:(NSString *)bundleName
                     bundleClass:(Class)cls
                       imageName:(NSString *)imageName;

@end
