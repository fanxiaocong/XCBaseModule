//
//  XCViewController.m
//  XCBaseModule
//
//  Created by fanxiaocong on 04/20/2018.
//  Copyright (c) 2018 fanxiaocong. All rights reserved.
//

#import "XCViewController.h"
#import "XCUserService+XCTestService.h"
#import <XCBaseModule/XCVersionUpdateTool.h>

@interface XCViewController ()

@end

@implementation XCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [XCVersionUpdateTool checkNewVersion:@"1.1" content:@"版本更新啦！" appURL:@"xxx"];
}

#pragma mark - 🎬 👀 Action Method 👀

- (IBAction)didClickLoginButtonAction:(id)sender
{
    /// 发送网络请求
    [self sendRequest];
}


#pragma mark - 🛰 🌐 Network Method 🌐

- (void)sendRequest
{
    [[XCUserService shareInstance] testNetworkServiceWithUserId:@"xxx" token:@"xxx" success:^(NSURLSessionDataTask *task, XCUserNetworkResult *resultM) {
        
        NSLog(@"成功*******成功");
        
    } failure:^(NSURLSessionDataTask *task, XCUserNetworkResult *resultM) {
        
        NSLog(@"失败*******失败");
    }];
}

@end
