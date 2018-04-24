//
//  XCNetworkStatus.h
//  AFNetworking
//
//  Created by 樊小聪 on 2018/4/23.
//


/*
 *  备注：检测网络状态工具类，基于 AFNetworkReachabilityManager 🐾
 */

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>


@interface XCNetworkStatus : NSObject

/// 网络检测类
@property (strong, nonatomic) AFNetworkReachabilityManager *reachDetector;
/// 是否联网
@property (assign, nonatomic) BOOL haveNetwork;

+ (instancetype)shareInstance;

@end
