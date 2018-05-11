# XCBaseModule

[![CI Status](http://img.shields.io/travis/fanxiaocong/XCBaseModule.svg?branch=master)](https://travis-ci.org/fanxiaocong/XCBaseModule)
[![Version](https://img.shields.io/cocoapods/v/XCBaseModule.svg?style=flat)](http://cocoapods.org/pods/XCBaseModule)
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](http://cocoapods.org/pods/XCBaseModule)
[![Platform](https://img.shields.io/badge/platform-iOS-green.svg?style=flat)](http://cocoapods.org/pods/XCBaseModule)
[![Support](https://img.shields.io/badge/support-iOS%209%2B%20-green.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;

***
|Author|小小聪明屋|
|---|---|
|E-mail|1016697223@qq.com|
|GitHub|https://github.com/fanxiaocong|
|Blog|http://www.cnblogs.com/fanxiaocong|
***


## Example

### `XCAppConfigure`&nbsp;App的全局配置
这个类是一个单例，主要只是用来记录App的一些全局属性，可以在 AppDelelgate 中统一配置这些属性，然后在需要用到这些属性的时候直接获取就可以了，当然如果您不喜欢这种处理方式可以不导入此类。

```objc
/// 设置 app 的全局配置
[XCAppConfigure configureApplication:^(XCAppConfigure *configure) {
        
	// 这里的所有属性，都只是做一个保存，在一个地方统一配置，需要用到的地方直接获取
   /// - 字体
   configure.titleFont = [UIFont systemFontOfSize:20];
   configure.subTitleFont = [UIFont systemFontOfSize:20];
   configure.littleSubTitleFont = [UIFont systemFontOfSize:20];
   configure.navigationTitleFont = [UIFont systemFontOfSize:20];
}];
``` 

### `Category`&nbsp;App组件化中常用分类
如果您的项目需要组件化，那么这些分类可能会帮助到您，主要是一些视图与资源的加载的方法，如果您的项目不需要组件化或者您不需要用到这些方法，可以不导入该模块。

- `<NSBundle+XCLoad.h>`&nbsp;Bundle资源的加载
- `<NSObject+XCLog.h>`&nbsp;打印日志时，将数组和字典中的 UTF-8 码转化为中文
- `<UIImage+XCLoad.h>`&nbsp;加载Bundle中的图片资源
- `<UIView+XCLoad.h>`&nbsp;加载Bundle中的视图
- `<UIViewController+XCLoad.h>`&nbsp;加载Bundle中的控制器

### `Network`&nbsp;网络请求封装
基于 `XCNetworking` 二次封装的网络请求工具类(其底层基于AFNetworking)，可以统一配置网络请求的一些常用参数。

- `<XCUserNetwork.h>`&nbsp;负责网络请求
	- 继承关系
		- `XCUserNetwork` > `XCNetworking` > `AFNetworking`
	- 支持 GET、POST、图片上传、文件下载四种常用的请求
- `<XCUserNetworkResult.h>`&nbsp;网络请求结果的一个包装类
	- `result`&nbsp;网络请求返回的原始数据
	- `message`&nbsp;提示语，您可以根据返回的数据设置这个值
	- `status`&nbsp;网络请求的状态，您需要根据返回的数据来更新这个状态
	
- `<XCUserService.h>`&nbsp;接口服务类
	- 网络请求的全局配置类，您可以在 AppDelegate 中使用该类来进行网络请求的全局配置，比如 BaseURL(接口请求总地址)、请求头的设置、请求结果的统一配置等等。
	
```objc
[XCUserService configureBaseURL:SERVICE_URL prepareRequestBlock:^(XCUserNetwork *userNetwork) {
    /// 配置请求前的操作
        
    // 设置请求头
    // [userNetwork.manager.requestSerializer setValue:@"JSESSIONID=7116FCB88BDB5B50A7268BF679A5E924" forHTTPHeaderField:@"Cookie"];
    // userNetwork.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    // userNetwork.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", nil];
        
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
```

   - 您可以根据不同的模块为该类设置相应的分类，在分类中实现接口的请求参数和名称的配置。
     
```objc
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
```

### `Tools`&nbsp;常用工具
- `<XCUserInformationTool.h>`&nbsp;用户账号管理类
- `<XCVersionUpdateTool.h>`&nbsp;检测版本工具类


## Installation

### CocoaPods
- 导入所有模块

```objc
pod 'XCBaseModule'
```
- 只导入 AppConfigure 模块

```objc
pod 'XCBaseModule/AppConfigure'
```
- 只导入 Category 模块

```objc
pod 'XCBaseModule/Category'
```
- 只导入 Network 模块

```objc
pod 'XCBaseModule/Network'
```
- 只导入 Tools 模块

```objc
pod 'XCBaseModule/Tools'
```