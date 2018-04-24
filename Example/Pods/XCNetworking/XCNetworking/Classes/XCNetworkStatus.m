//
//  XCNetworkStatus.m
//  AFNetworking
//
//  Created by 樊小聪 on 2018/4/23.
//


/*
 *  备注：检测网络状态工具类，基于 AFNetworkReachabilityManager 🐾
 */

#import "XCNetworkStatus.h"
#import <XCMacros/XCMacros.h>


@implementation XCNetworkStatus

static XCNetworkStatus *_instance = nil;

+ (XCNetworkStatus *)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[XCNetworkStatus alloc] init];
    });
    return _instance;
}

- (void)dealloc
{
    [_reachDetector startMonitoring];
    _reachDetector = nil;
}

- (instancetype)init
{
    if (self = [super init])
    {
         [self initCurrentNetwork];
    }
    return self;
}

/**
 *  初始化网络检测类
 */
- (void)initCurrentNetwork
{
    self.reachDetector = [AFNetworkReachabilityManager sharedManager];
    /// 监听状态的改变
    __weak typeof(self)weakSelf = self;
    [self.reachDetector setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status)
        {
            case AFNetworkReachabilityStatusNotReachable:
            {
                weakSelf.haveNetwork = NO;
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                weakSelf.haveNetwork = YES;
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                weakSelf.haveNetwork = YES;
                break;
            }
            case AFNetworkReachabilityStatusUnknown:
            {
                weakSelf.haveNetwork = NO;
                break;
            }
        }
    }];
    /// 开始检测
    [self.reachDetector startMonitoring];
}

@end
