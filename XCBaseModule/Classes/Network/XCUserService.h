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
/// 请求前的操作
@property (copy, nonatomic, readonly) void(^prepareBlock)(XCUserNetwork *userNetwork);

+ (instancetype)shareInstance;

#pragma mark - 👀 网络配置 👀 💤

/**
 *  网络配置
 *
 *  @param baseURL      接口请求总地址
 *  @param prepareBlock 请求前的操作
 *  @param resultBlock  请求结果的处理
 resultM：外部可以根据需要，解析 resultM 中的 result 属性，然后重新更新 resultM.message 和 resultM.status 属性
 resultM.status == XCUserNetworkResultStatusSuccess，将会回调 success
 resultM.status == XCUserNetworkResultStatusFailure，将会回调 failure
 resultM.status == XCUserNetworkResultStatusPass，不进行回调(不做任何操作)
 resultM.result 控制着 success 回调中的 result
 resultM.message 控制着 failure 回调中的 reason
 */
+ (void)configureBaseURL:(NSString *)baseURL
     prepareRequestBlock:(void(^)(XCUserNetwork *userNetwork))prepareBlock
      requestResultBlock:(void(^)(NSURLSessionDataTask *task, XCUserNetworkResult *resultM))resultBlock;

@end
