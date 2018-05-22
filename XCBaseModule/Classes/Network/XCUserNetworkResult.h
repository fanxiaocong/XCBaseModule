//
//  XCUserNetworkResult.h
//  AFNetworking
//
//  Created by 樊小聪 on 2018/4/28.
//


/*
 *  备注：网络请求结果 🐾
 */

#import <Foundation/Foundation.h>


/**
 *  网络请求结果
 */
typedef NS_ENUM(NSInteger, XCUserNetworkResultStatus){
    XCUserNetworkResultStatusSuccess, /// 成功
    XCUserNetworkResultStatusFailure, /// 失败
    XCUserNetworkResultStatusPass /// 不做任何操作
};


@interface XCUserNetworkResult : NSObject

/// 请求结果（网络请求返回的原始数据）
@property (strong, nonatomic) id result;
/// 请求结果状态码
@property (assign, nonatomic) NSInteger resultCode;
/// 网络请求的状态
@property (assign, nonatomic) XCUserNetworkResultStatus status;
/// 提示语
@property (copy, nonatomic) NSString *message;

@end
