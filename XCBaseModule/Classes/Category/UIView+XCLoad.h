//
//  UIView+XCLoad.h
//  Pods-XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/4/20.
//

#import <UIKit/UIKit.h>

@interface UIView (XCLoad)

/**
 *  从 Bundle 中加载视图
 *
 *  @param nibName  nib名称
 */
+ (instancetype)viewFromCurrentBundleWithNibName:(NSString *)nibName;


/**
 *   从 Bundle 中加载指定名称的视图
 *
 *  @param bundleName   bundle名称
 *  @param nibName      nib名称
 */
+ (instancetype)viewFromCurrentBundleWithBundleName:(NSString *)bundleName
                                            nibName:(NSString *)nibName;

@end
