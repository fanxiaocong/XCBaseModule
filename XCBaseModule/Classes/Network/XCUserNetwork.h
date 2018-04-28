//
//  XCUserNetwork.h
//  AFNetworking
//
//  Created by 樊小聪 on 2018/4/20.
//

/*
 *  备注：网络层 🐾
 */

#import <XCNetworking/XCNetworking.h>
#import "AFNetworking.h"
#import "XCUserNetworkResult.h"

typedef void(^XCNetworkSuccessBlock) (NSURLSessionDataTask *task, id result);
typedef void(^XCNetworkFailureBlock) (NSURLSessionDataTask *task, NSString *reason);
typedef void(^XCNetworkProgressBlock) (NSProgress *progress);
typedef void(^XCNetworkDownloadBlock) (NSURLResponse *response, NSURL *filePath, NSError *error);


@interface XCUserNetwork : XCNetworking

/// 接口请求总地址
@property (copy, nonatomic) NSString *baseURL;

/// 配置请求前的操作：可以在此配置请求的基本参数（请求头，是否需要序列化等，每发起一次网络请求都会调用该方法）
@property (copy, nonatomic) void(^configurePrepareReuqestBlock)(XCUserNetwork *userNetwork);

/// 配置请求结果的回调
/// resultM：外部可以根据需要，解析 resultM 中的 result 属性，然后重新更新 resultM.message 和 resultM.status 属性
//  resultM.status == XCUserNetworkResultStatusSuccess，将会回调 success
//  resultM.status == XCUserNetworkResultStatusFailure，将会回调 failure
//  resultM.status == XCUserNetworkResultStatusPass，不进行回调(不做任何操作)
/// resultM.result 控制着 success 回调中的 result
/// resultM.message 控制着 failure 回调中的 reason
@property (copy, nonatomic) void(^configureRequestResultBlock)(NSURLSessionDataTask *task, XCUserNetworkResult *resultM);


/**
 *  GET 请求
 *
 *  @param action 接品名称
 *  @param params 参数
 */
- (void)getWithAction:(NSString *)action
               params:(NSDictionary *)params
              success:(XCNetworkSuccessBlock)success
              failure:(XCNetworkFailureBlock)failure;

/**
 *  POST 请求
 *
 *  @param action 接口名称
 *  @param params 参数
 */
- (void)postWithAction:(NSString *)action
                params:(NSDictionary *)params
               success:(XCNetworkSuccessBlock)success
               failure:(XCNetworkFailureBlock)failure;


/**
 *  上传图片（图片名称：随机唯一图片）
 *
 *  @param action   接口名称
 *  @param params   参数
 *  @param images   图片数组
 *  @param directoryName  服务器上存放图片的文件夹名称
 *  @param progress 图片上传进度
 */
- (void)uploadImageWithAction:(NSString *)action
                       params:(NSDictionary *)params
                       images:(NSArray<UIImage *> *)images
                directoryName:(NSString *)directoryName
                     progress:(XCNetworkProgressBlock)progress
                      success:(XCNetworkSuccessBlock)success
                      failure:(XCNetworkFailureBlock)failure;


/**
 *  上传图片
 *
 *  @param action   接口名称
 *  @param params   参数
 *  @param images   图片数组
 *  @param directoryName  服务器上存放图片的文件夹名称
 *  @param fileNames 图片名称
 *  @param progress  图片上传进度
 */
- (void)uploadImageWithAction:(NSString *)action
                       params:(NSDictionary *)params
                       images:(NSArray<UIImage *> *)images
                directoryName:(NSString *)directoryName
                    fileNames:(NSArray<NSString *> *)fileNames
                     progress:(XCNetworkProgressBlock)progress
                      success:(XCNetworkSuccessBlock)success
                      failure:(XCNetworkFailureBlock)failure;

/**
 *  下载文件
 *
 *  @param url              文件地址
 *  @param destinationPath  要存储的路径
 *  @param progress         下载进度
 */
- (void)downloadWithURL:(NSString *)url
                   path:(NSString *)destinationPath
               progress:(XCNetworkProgressBlock)progress
                success:(XCNetworkDownloadBlock)success
                failure:(XCNetworkDownloadBlock)failure;

@end
