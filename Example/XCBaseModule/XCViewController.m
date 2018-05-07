//
//  XCViewController.m
//  XCBaseModule
//
//  Created by fanxiaocong on 04/20/2018.
//  Copyright (c) 2018 fanxiaocong. All rights reserved.
//

#import "XCViewController.h"
#import "XCUserService+XCTestService.h"


@interface XCViewController ()

@end

@implementation XCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /// 发送网络请求
    [self sendRequest];
}

#pragma mark - 🛰 🌐 Network Method 🌐

- (void)sendRequest
{
    [[XCUserService shareInstance] testNetworkServiceWithUserId:@"" token:@"" success:^(NSURLSessionDataTask *task, id result) {
        
    } failure:^(NSURLSessionDataTask *task, NSString *reason) {
        
    }];
}

@end
