//
//  XCUserService+XCTestService.m
//  XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/5/7.
//  Copyright © 2018年 fanxiaocong. All rights reserved.
//


/*
 *  备注：测试网络请求 🐾
 */

#import "XCUserService+XCTestService.h"

@implementation XCUserService (XCTestService)

- (void)testNetworkServiceWithUserId:(NSString *)userId
                               token:(NSString *)token
                             success:(XCNetworkSuccessBlock)success
                             failure:(XCNetworkFailureBlock)failure
{
    NSDictionary *params = @{
                             @"userId" : userId,
                             @"token"  : token
                             };
    
    [self.network postWithAction:@"api/getuserinfo" params:params success:^(NSURLSessionDataTask *task, id result) {
        
    } failure:^(NSURLSessionDataTask *task, NSString *reason) {
        
    }];
}

@end
