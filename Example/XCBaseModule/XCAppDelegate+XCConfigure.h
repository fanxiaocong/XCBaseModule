//
//  XCAppDelegate+XCConfigure.h
//  XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/5/7.
//  Copyright © 2018年 fanxiaocong. All rights reserved.
//

/*
 *  备注：测试App全局配置 🐾
 */

#import "XCAppDelegate.h"

@interface XCAppDelegate (XCConfigure)

- (void)configure_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

@end
