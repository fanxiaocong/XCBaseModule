//
//  XCNetworking.h
//  Pods-XCNetworking_Example
//
//  Created by 樊小聪 on 2018/4/20.
//


/*
 *  备注：网络请求父类，基于 AFN 的封装 🐾
 */


#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>


@interface XCNetworking : NSObject

/** 👀 网络请求管理类 👀 */
@property (strong, nonatomic, readonly) AFHTTPSessionManager *manager;
/** 👀 下载管理类 👀 */
@property (strong, nonatomic, readonly) AFURLSessionManager *downloadManager;


/**
 *  请求前的操作，子类可以在此配置一些请求的参数：如请求头的设置、是否需要序列化等
 *  ！！！子类重写该方法时需要调用 [super prepareForRequest]
 */
- (void)prepareForRequest;

/**
 *  通过 GET 方式请求服务器
 *
 *  @param url          接口请求全地址
 *  @param parameters   参数
 *  @param success      请求成功的回调
 *  @param failure      请求失败的回调
 */
- (void)sendGetRequestWithURL:(NSString *)url
                   parameters:(NSDictionary *)parameters
                      success:(void(^)(NSURLSessionDataTask *task, id result))success
                      failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  通过 POST 方式请求服务器
 *
 *  @param url          接口请求全地址
 *  @param parameters   参数
 *  @param success      请求成功的回调
 *  @param failure      请求失败的回调
 */
- (void)sendPostRequestWithURL:(NSString *)url
                    parameters:(NSDictionary *)parameters
                       success:(void(^)(NSURLSessionDataTask *task, id result))success
                       failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;


/**
 *  上传图片
 *
 *  @param url              接口请求全地址
 *  @param parameters       参数
 *  @param images           图片数组
 *  @param directoryName    服务器上存放图片的文件夹名称
 *  @param progress         上传进度
 *  @param success          请求成功的回调
 *  @param failure          请求失败的回调
 */
- (void)uploadImagesWithURL:(NSString *)url
                 parameters:(NSDictionary *)parameters
                     images:(NSArray<UIImage *> *)images
              directoryName:(NSString *)directoryName
                   progress:(void(^)(NSProgress *p))progress
                    success:(void(^)(NSURLSessionDataTask *task, id result))success
                    failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;


/**
 *  上传图片
 *
 *  @param url              接口请求全地址
 *  @param parameters       参数
 *  @param images           图片数组
 *  @param directoryName    服务器上存放图片的文件夹名称
 *  @param fileNames        图片名称
 *  @param progress         上传进度
 *  @param success          请求成功的回调
 *  @param failure          请求失败的回调
 */
- (void)uploadImagesWithURL:(NSString *)url
                 parameters:(NSDictionary *)parameters
                     images:(NSArray<UIImage *> *)images
              directoryName:(NSString *)directoryName
                  fileNames:(NSArray<NSString *> *)fileNames
                   progress:(void(^)(NSProgress *p))progress
                    success:(void(^)(NSURLSessionDataTask *task, id result))success
                    failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;


/**
 *  上传文件
 *
 *  @param url              接口请求全地址
 *  @param parameters       参数
 *  @param data             文件数据
 *  @param directoryName    服务器上存放图片的文件夹名称
 *  @param fileName         文件名称
 *  @param progress         上传进度
 *  @param success          请求成功的回调
 *  @param failure          请求失败的回调
 */
- (void)uploadFileWithURL:(NSString *)url
               parameters:(NSDictionary *)parameters
                     data:(NSData *)data
            directoryName:(NSString *)directoryName
                 fileName:(NSString *)fileName
                 progress:(void(^)(NSProgress *p))progress
                  success:(void(^)(NSURLSessionDataTask *task, id result))success
                  failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;


/**
 *  下载文件
 *
 *  @param url              文件地址
 *  @param destinationPath  要存储的路径
 *  @param progress         下载进度
 *  @param success          成功时候的回调
 *  @param failure          失败时候的回调
 */
- (void)downloadWithURL:(NSString *)url
        destinationPath:(NSString *)destinationPath
               progress:(void(^)(NSProgress *p))progress
                success:(void(^)(NSURLResponse *response, NSURL *filePath))success
                failure:(void(^)(NSURLResponse *response, NSError *error))failure;

/**
 *  取消下载请求
 */
- (void)cancelDownloadRequest;

@end
