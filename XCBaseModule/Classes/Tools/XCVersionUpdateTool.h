//
//  XCVersionUpdateTool.h
//  AFNetworking
//
//  Created by 樊小聪 on 2018/5/11.
//


/*
 *  备注：版本更新工具类 🐾
 */

#import <Foundation/Foundation.h>

@interface XCVersionUpdateTool : NSObject

/**
 *  检测版本更新，如果有新版本：弹框提示，点击 “确认” 跳转 AppStore
 *
 *  @param version  需要检测的版本
 *  @param content  升级内容
 *  @param appURL   App在AppStore的链接地址
 */
+ (void)checkNewVersion:(NSString *)version
                content:(NSString *)content
                 appURL:(NSString *)appURL;

@end
