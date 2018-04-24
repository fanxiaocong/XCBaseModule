//
//  UIViewController+XCLoad.h
//  Pods-XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/4/20.
//

#import <UIKit/UIKit.h>

@interface UIViewController (XCLoad)

/**
 *  根据 storyBoardName 和 控制器ID 实例化一个 控制器
 *
 *  @param storyBoardName   storyBoard名称
 *  @param viewcontrollerID 控制器ID
 */
+ (instancetype)viewcontrollerFromCurrentBundleWithStoryBoardName:(NSString *)storyBoardName
                                                 viewcontrollerID:(NSString *)viewcontrollerID;



/**
 *  根据 bundleName、storyBoardName 和 控制器ID 实例化一个 控制器
 *
 *  @param bundleName       bundle名称
 *  @param storyBoardName   storyBoard名称
 *  @param viewcontrollerID 控制器ID
 */
+ (instancetype)viewcontrollerFromCurrentBundleWithBundleName:(NSString *)bundleName
                                               storyBoardName:(NSString *)storyBoardName
                                             viewcontrollerID:(NSString *)viewcontrollerID;


@end
