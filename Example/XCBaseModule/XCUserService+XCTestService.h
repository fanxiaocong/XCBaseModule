//
//  XCUserService+XCTestService.h
//  XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/5/7.
//  Copyright © 2018年 fanxiaocong. All rights reserved.
//


/*
 *  备注：测试网络请求 🐾
 */

#import <XCBaseModule/XCUserService.h>

@interface XCUserService (XCTestService)

/**
 *  测试接口请求
 *
 *  @param userId   测试参数
 *  @param token    测试参数
 *  @param success  成功的回调
 *  @param failure  失败的回调
 */
- (void)testNetworkServiceWithUserId:(NSString *)userId
                               token:(NSString *)token
                             success:(XCNetworkResultBlock)success
                             failure:(XCNetworkResultBlock)failure;

@end
