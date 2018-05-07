//
//  XCAppDelegate+XCConfigure.m
//  XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/5/7.
//  Copyright © 2018年 fanxiaocong. All rights reserved.
//

/*
 *  备注：测试App全局配置 🐾
 */

#import "XCAppDelegate+XCConfigure.h"
#import <XCBaseModule/XCAppConfigure.h>


@implementation XCAppDelegate (XCConfigure)

- (void)configure_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /// 设置 app 的全局配置
    [XCAppConfigure configureApplication:^(XCAppConfigure *configure) {
        
        // 这里的所有属性，都只是做一个保存，在一个地方统一配置，需要用到的地方直接获取
        /// - 字体
        configure.titleFont = [UIFont systemFontOfSize:20];
        configure.subTitleFont = [UIFont systemFontOfSize:20];
        configure.littleSubTitleFont = [UIFont systemFontOfSize:20];
        configure.navigationTitleFont = [UIFont systemFontOfSize:20];
    }];
}

@end
