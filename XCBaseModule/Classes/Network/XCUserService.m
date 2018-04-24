//
//  XCUserService.m
//  AFNetworking
//
//  Created by 樊小聪 on 2018/4/23.
//


/*
 *  备注：网络服务层 🐾
 */

#import "XCUserService.h"

@implementation XCUserService

static XCUserService *_instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _network = [[XCUserNetwork alloc] init];
    }
    return self;
}

+ (void)configureBaseURL:(NSString *)baseURL
     prepareRequestBlock:(void (^)(XCUserNetwork *))prepareBlock
      requestResultBlock:(XCUserNetworkResult (^)(NSURLSessionDataTask *, id))resultBlock
{
    XCUserService *service = [XCUserService shareInstance];
    service.network.baseURL = baseURL;
    service.network.configurePrepareReuqestBlock = prepareBlock;
    service.network.configureRequestResultBlock  = resultBlock;
}

@end
