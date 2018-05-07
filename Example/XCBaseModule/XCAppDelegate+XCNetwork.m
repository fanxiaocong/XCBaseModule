//
//  XCAppDelegate+XCNetwork.m
//  XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/5/7.
//  Copyright © 2018年 fanxiaocong. All rights reserved.
//


/*
 *  备注：测试网络请求 🐾
 */

#import "XCAppDelegate+XCNetwork.h"
#import <XCBaseModule/XCUserService.h>

/// 接口请求总地址
#define SERVICE_URL @"xxx"


@implementation XCAppDelegate (XCNetwork)

- (void)net_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [XCUserService configureBaseURL:SERVICE_URL prepareRequestBlock:^(XCUserNetwork *userNetwork) {
        /// 配置请求前的操作
        
        /// ***测试***
        // 设置请求头
        //        [userNetwork.manager.requestSerializer setValue:@"JSESSIONID=7116FCB88BDB5B50A7268BF679A5E924" forHTTPHeaderField:@"Cookie"];
//        userNetwork.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//        userNetwork.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", nil];
        
    } requestResultBlock:^(NSURLSessionDataTask *task, XCUserNetworkResult *resultM) {
        
        /// 配置请求完成的回调，如果后台接口返回的数据比较 “规范”，则可以在此处进行统一配置
        
        /// ***测试***
        if ([resultM.result isKindOfClass:[NSError class]]) {
            /// 后台接口报错
            // 解析错误...略
            resultM.message = @"获取数据失败";
            resultM.status = XCUserNetworkResultStatusFailure;
            return;
        }
        
        /// 这里假设根据 code 的值来进行处理：code=0 表示成功； code=1 示登录失效； 其他表示失败
        switch ([resultM.result[@"code"] integerValue]) {
            case 0: // 成功
            {
                NSLog(@"请求成功");
                resultM.status = XCUserNetworkResultStatusSuccess;
                break;
            }
            case 1: // 登录失效
            {
                NSLog(@"登录失效了，请示重新登录");
                resultM.status = XCUserNetworkResultStatusPass;
                resultM.message = @"您的账号在其他设备上登录，请重新登录";
                break;
            }
            default: // 失败
            {
                NSLog(@"请求失败");
                resultM.status = XCUserNetworkResultStatusFailure;
                resultM.message = resultM.result[@"message"];
                break;
            }
        }
    }];
}

@end
