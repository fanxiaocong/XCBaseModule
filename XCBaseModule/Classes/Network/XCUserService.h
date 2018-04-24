//
//  XCUserService.h
//  AFNetworking
//
//  Created by 樊小聪 on 2018/4/23.
//


/*
 *  备注：网络服务层 🐾
 */

#import <Foundation/Foundation.h>
#import "XCUserNetwork.h"


@interface XCUserService : NSObject

/// 网络请求类
@property (strong, nonatomic) XCUserNetwork *network;


+ (instancetype)shareInstance;

#pragma mark - 👀 网络配置 👀 💤

/**
 *  网络配置
 *
 *  @param baseURL      接口请求总地址
 *  @param prepareBlock 请求前的操作
 *  @param resultBlock  请求结果的处理
 */
+ (void)configureBaseURL:(NSString *)baseURL
     prepareRequestBlock:(void(^)(XCUserNetwork *userNetwork))prepareBlock
      requestResultBlock:(XCUserNetworkResult(^)(NSURLSessionDataTask *task, id result))resultBlock;

@end
