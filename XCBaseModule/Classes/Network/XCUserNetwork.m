//
//  XCUserNetwork.m
//  AFNetworking
//
//  Created by 樊小聪 on 2018/4/20.
//


/*
 *  备注：网络层 🐾
 */

#import "XCUserNetwork.h"
#import <XCNetworking/XCNetworkStatus.h>


@interface XCUserNetwork ()

/// 处理网络请求的结果
@property (strong, nonatomic) XCUserNetworkResult *resultM;

@end


@implementation XCUserNetwork

- (instancetype)init
{
    if (self = [super init])
    {
        /// 开启网络检测
        [XCNetworkStatus shareInstance];
        /// 设置请求结果
        self.resultM = [[XCUserNetworkResult alloc] init];
    }
    return self;
}


#pragma mark - 👀 Override 👀 💤

- (void)prepareForRequest
{
    [super prepareForRequest];
    
    /// 处理请求前的操作
    if (self.configurePrepareReuqestBlock) {
        self.configurePrepareReuqestBlock(self);
    }
}

#pragma mark - 🔒 👀 Privite Method 👀

/**
 *  处理请求成功的结果
 *
 *  @param task         请求事务
 *  @param result       请求结果数据
 */
- (void)handleRequestResultWithTask:(NSURLSessionDataTask *)task
                             result:(id)result
                          isSuccess:(BOOL)isSuccess
                            success:(XCNetworkSuccessBlock)success
                            failure:(XCNetworkFailureBlock)failure;
{
    /// 当前没有网络
    if (![XCNetworkStatus shareInstance].haveNetwork) {
        if (failure) {
            failure(task, @"网络连接失败，请检查网络");
        }
        return;
    }
    
    /// 当前没有对请求结果进行处理，采用默认的处理
    if (!self.configureRequestResultBlock) {
        if (isSuccess) {
            if (success) { success(task, result); }
            return;
        }
        
        if (failure) { failure(task, @"获取数据失败"); };
        return;
    }
    
    self.resultM.result = result;
    
    /// 根据外面调用者的配置进行处理
    self.configureRequestResultBlock(task, self.resultM);
    XCUserNetworkResultStatus status = self.resultM.status;
    
    switch (status)
    {
        case XCUserNetworkResultStatusSuccess:    // 成功
        {
            if (success) { success(task, result); }
            break;
        }
        case XCUserNetworkResultStatusFailure:    // 失败
        {
            if (failure) { failure(task, self.resultM.message); }
            break;
        }
        case XCUserNetworkResultStatusPass:       // 不做处理
        {
            break;
        }
    }
}

#pragma mark - 🔓 👀 Public Method 👀

- (void)getWithAction:(NSString *)action
               params:(NSDictionary *)params
              success:(XCNetworkSuccessBlock)success
              failure:(XCNetworkFailureBlock)failure
{
    [self sendGetRequestWithURL:[self.baseURL stringByAppendingString:action]
                     parameters:params
                        success:^(NSURLSessionDataTask *task, id result) {
                            
                            /// 处理请求结果
                            [self handleRequestResultWithTask:task result:result isSuccess:YES success:success failure:failure];
                        }
                        failure:^(NSURLSessionDataTask *task, NSError *error) {
        
                            /// 处理请求结果
                            [self handleRequestResultWithTask:task result:error isSuccess:NO success:success failure:failure];
                        }];
}


- (void)postWithAction:(NSString *)action
                params:(NSDictionary *)params
               success:(XCNetworkSuccessBlock)success
               failure:(XCNetworkFailureBlock)failure
{
    [self sendPostRequestWithURL:[self.baseURL stringByAppendingString:action]
                      parameters:params
                         success:^(NSURLSessionDataTask *task, id result) {
                             
                             /// 处理请求结果
                             [self handleRequestResultWithTask:task result:result isSuccess:YES success:success failure:failure];
                         }
                         failure:^(NSURLSessionDataTask *task, NSError *error) {
                             
                             /// 处理请求结果
                             [self handleRequestResultWithTask:task result:error isSuccess:NO success:success failure:failure];
                         }];
}


- (void)uploadImageWithAction:(NSString *)action
                       params:(NSDictionary *)params
                       images:(NSArray<UIImage *> *)images
                directoryName:(NSString *)directoryName
                     progress:(XCNetworkProgressBlock)progress
                      success:(XCNetworkSuccessBlock)success
                      failure:(XCNetworkFailureBlock)failure
{
    [self uploadImagesWithURL:[self.baseURL stringByAppendingString:action]
                   parameters:params
                       images:images
                directoryName:directoryName
                     progress:progress
                      success:^(NSURLSessionDataTask *task, id result) {
                          
                          /// 处理请求结果
                          [self handleRequestResultWithTask:task result:result isSuccess:YES success:success failure:failure];
                      }
                      failure:^(NSURLSessionDataTask *task, NSError *error) {
                          
                          /// 处理请求结果
                          [self handleRequestResultWithTask:task result:error isSuccess:NO success:success failure:failure];
                      }];
}


- (void)uploadImageWithAction:(NSString *)action
                       params:(NSDictionary *)params
                       images:(NSArray<UIImage *> *)images
                directoryName:(NSString *)directoryName
                    fileNames:(NSArray<NSString *> *)fileNames
                     progress:(XCNetworkProgressBlock)progress
                      success:(XCNetworkSuccessBlock)success
                      failure:(XCNetworkFailureBlock)failure
{
    [self uploadImagesWithURL:[self.baseURL stringByAppendingString:action]
                   parameters:params
                       images:images
                directoryName:directoryName
                    fileNames:fileNames
                     progress:progress
                      success:^(NSURLSessionDataTask *task, id result) {
                          
                          /// 处理请求结果
                          [self handleRequestResultWithTask:task result:result isSuccess:YES success:success failure:failure];
                      }
                      failure:^(NSURLSessionDataTask *task, NSError *error) {
                          
                          /// 处理请求结果
                          [self handleRequestResultWithTask:task result:error isSuccess:NO success:success failure:failure];
                      }];
}

- (void)downloadWithURL:(NSString *)url
                   path:(NSString *)destinationPath
               progress:(XCNetworkProgressBlock)progress
                success:(XCNetworkDownloadBlock)success
                failure:(XCNetworkDownloadBlock)failure
{
    [self downloadWithURL:url
          destinationPath:destinationPath
                 progress:progress
                  success:^(NSURLResponse *response, NSURL *filePath) {
        
                      if (success) {
                          success(response, filePath, NULL);
                      }
                      
                  } failure:^(NSURLResponse *response, NSError *error) {
        
                      if (failure) {
                          failure(response, NULL, error);
                      }
                  }];
}


@end
