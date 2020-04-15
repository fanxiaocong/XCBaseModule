//
//  XCNetworking.m
//  Pods-XCNetworking_Example
//
//  Created by 樊小聪 on 2018/4/20.
//

#import "XCNetworking.h"
#import <XCMacros/XCMacros.h>


@interface XCNetworking ()

/** 👀 下载任务 👀 */
@property (strong, nonatomic) NSURLSessionDownloadTask *downloadTask;

@end


@implementation XCNetworking

#pragma mark - 🛠 👀 Setter Method 👀

- (void)setManager:(AFHTTPSessionManager *)manager
{
    _manager = manager;
}

- (void)setDownloadManager:(AFURLSessionManager *)downloadManager
{
    _downloadManager = downloadManager;
}

#pragma mark - 🔒 👀 Privite Method 👀

- (void)_print:(NSString *)logs
{
    if (!self.printLogEnabled)  return;
    
    DLog(@"%@", logs);
}

#pragma mark - 🔓 👀 Public Method 👀

- (void)prepareForRequest
{
    [self _print:@"设置请求配置开始"];
    
    self.manager = [AFHTTPSessionManager manager];
    self.manager.responseSerializer.acceptableContentTypes = [self.manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    self.manager.requestSerializer.timeoutInterval = 30;
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [self _print:@"设置请求配置结束"];
}

- (void)sendGetRequestWithURL:(NSString *)url
                   parameters:(NSDictionary *)parameters
                      success:(void(^)(NSURLSessionDataTask *task, id result))success
                      failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [self _print:@"请求开始：******************** GET ********************"];
        
    /// 配置请求的基本配置
    [self prepareForRequest];
    
    [self _print:[NSString stringWithFormat:@"请求地址：%@", url]];
    [self _print:[NSString stringWithFormat:@"请求参数：%@", parameters]];
        
    @weakify(self);
    [self.manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        @strongify(self);
        [self _print:[NSString stringWithFormat:@"responseObject：%@", responseObject]];
        if (success) {  /// 成功
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        @strongify(self);
        [self _print:[NSString stringWithFormat:@"请求结果失败 原因：%@", error.localizedDescription]];
        if (failure) {  /// 失败
            failure(task, error);
        }
    }];
    
    [self _print:@"请求结束：******************** GET *******************"];
}

- (void)sendPostRequestWithURL:(NSString *)url
                    parameters:(NSDictionary *)parameters
                       success:(void(^)(NSURLSessionDataTask *task, id result))success
                       failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [self _print:@"请求开始：******************** POST ********************"];
    
    /// 配置请求的基本配置
    [self prepareForRequest];
    
    [self _print:[NSString stringWithFormat:@"请求地址：%@", url]];
    [self _print:[NSString stringWithFormat:@"请求参数：%@", parameters]];
    
    @weakify(self);
    [self.manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        @strongify(self);
        [self _print:[NSString stringWithFormat:@"responseObject：%@", responseObject]];
        if (success) {  /// 成功
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        @strongify(self);
        [self _print:[NSString stringWithFormat:@"请求结果失败 原因：%@", error.localizedDescription]];
        if (failure) {  /// 失败
            failure(task, error);
        }
    }];
    
    [self _print:@"请求结束：******************** POST ********************"];
}


- (void)uploadImagesWithURL:(NSString *)url
                 parameters:(NSDictionary *)parameters
                     images:(NSArray<UIImage *> *)images
              directoryName:(NSString *)directoryName
                   progress:(void(^)(NSProgress *p))progress
                    success:(void(^)(NSURLSessionDataTask *task, id result))success
                    failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure
{
    /// 图片名称数组
    NSMutableArray *fileNames = [NSMutableArray array];
    for (NSInteger i = 0; i < images.count; i ++)
    {
        // 生成一个唯一的图片名称
        NSString *fileName = [NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]];
        fileName = [NSString stringWithFormat:@"fileName_%@_%ld.png",fileName,(long)i];
        [fileNames addObject:fileName];
    }
    
    [self uploadImagesWithURL:url
                   parameters:parameters
                       images:images
                directoryName:directoryName
                    fileNames:fileNames
                     progress:progress
                      success:success
                      failure:failure];
}


- (void)uploadImagesWithURL:(NSString *)url
                 parameters:(NSDictionary *)parameters
                     images:(NSArray<UIImage *> *)images
              directoryName:(NSString *)directoryName
                  fileNames:(NSArray<NSString *> *)fileNames
                   progress:(void(^)(NSProgress *p))progress
                    success:(void(^)(NSURLSessionDataTask *task, id result))success
                    failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [self _print:@"请求开始：********************  POST 图片上传 ********************"];
    
    /// 配置请求的基本配置
    [self prepareForRequest];
    
    [self _print:[NSString stringWithFormat:@"请求地址：%@", url]];
    [self _print:[NSString stringWithFormat:@"请求参数：%@", parameters]];
    
    /// 开始上传
    @weakify(self);
    [self.manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        // 表单提交
        [images enumerateObjectsUsingBlock:^(UIImage * _Nonnull image, NSUInteger idx, BOOL * _Nonnull stop) {
            NSData *imageData = UIImagePNGRepresentation(image);
            [formData appendPartWithFileData:imageData name:directoryName fileName:fileNames[idx] mimeType:@"image/png"];
        }];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        // 上传进度
        if (progress) {
            progress(uploadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        @strongify(self);
        [self _print:[NSString stringWithFormat:@"responseObject：%@", responseObject]];
        if (success) {  /// 成功
            success(task, responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        @strongify(self);
        [self _print:[NSString stringWithFormat:@"请求结果失败 原因：%@", error.localizedDescription]];
        if (failure) {  /// 失败
            failure(task, error);
        }
    }];
    
    [self _print:@"请求结束：******************** POST 图片上传 ********************"];
}

- (void)uploadFileWithURL:(NSString *)url
               parameters:(NSDictionary *)parameters
                     data:(NSData *)data
            directoryName:(NSString *)directoryName
                 fileName:(NSString *)fileName
                 progress:(void(^)(NSProgress *p))progress
                  success:(void(^)(NSURLSessionDataTask *task, id result))success
                  failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure
{
    [self _print:@"请求开始：********************  POST 文件上传 ********************"];

    /// 配置请求的基本配置
    [self prepareForRequest];
    
    [self _print:[NSString stringWithFormat:@"请求地址：%@", url]];
    [self _print:[NSString stringWithFormat:@"请求参数：%@", parameters]];
    
    /// 开始上传
    @weakify(self);
    [self.manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        // 表单提交
        [formData appendPartWithFileData:data name:directoryName fileName:fileName mimeType:@"audio/mp3"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        // 上传进度
        if (progress) {
            progress(uploadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        @strongify(self);
        [self _print:[NSString stringWithFormat:@"responseObject：%@", responseObject]];
        if (success) {  /// 成功
            success(task, responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        @strongify(self);
        [self _print:[NSString stringWithFormat:@"请求结果失败 原因：%@", error.localizedDescription]];
        if (failure) {  /// 失败
            failure(task, error);
        }
    }];
    
    [self _print:@"请求开始：********************  文件上传 ********************"];
}


- (void)downloadWithURL:(NSString *)url
        destinationPath:(NSString *)destinationPath
               progress:(void(^)(NSProgress *p))progress
                success:(void(^)(NSURLResponse *response, NSURL *filePath))success
                failure:(void(^)(NSURLResponse *response, NSError *error))failure
{
    [self _print:@"请求开始：******************** 文件下载 ********************"];
    
    // 远程地址
    NSURL *URL = [NSURL URLWithString:url];
    
    //默认配置
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    self.downloadManager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    // 请求
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    // 下载Task操作
    @weakify(self);
    self.downloadTask = [self.downloadManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        // 下载进度
        progress(downloadProgress);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        @strongify(self);
        if (![[NSFileManager defaultManager] fileExistsAtPath:destinationPath])
        {
            [[NSFileManager defaultManager] createDirectoryAtPath:destinationPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        
        // 文件的下载路径
        NSString *filePath = [destinationPath stringByAppendingPathComponent:response.suggestedFilename];
        
        
        [self _print:[NSString stringWithFormat:@"文件下载路径：   %@", filePath]];
        
        return [NSURL fileURLWithPath:filePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        // 下载完成
        if (!error)
        {
            // 下载成功
            success(response, filePath);
        }
        else
        {
            // 下载失败
            failure(response, error);
        }
    }];
    
    //开始启动任务
    [self.downloadTask resume];
    
    [self _print:@"请求结束：******************** 文件下载 ********************"];
}

- (void)cancelDownloadRequest
{
    if (self.downloadTask)
    {
        [self.downloadTask cancel];
    }
}

@end
