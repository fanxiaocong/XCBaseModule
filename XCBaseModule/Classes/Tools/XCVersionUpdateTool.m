//
//  XCVersionUpdateTool.m
//  AFNetworking
//
//  Created by 樊小聪 on 2018/5/11.
//


/*
 *  备注：版本更新工具类 🐾
 */

#import "XCVersionUpdateTool.h"

@implementation XCVersionUpdateTool

#pragma mark - 🔓 👀 Public Method 👀

+ (void)checkNewVersion:(NSString *)version
                content:(NSString *)content
                 appURL:(NSString *)appURL
{
    // 取出目前的版本号
    NSString *lastVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    // 当前版本号
    NSString *newVersion = [NSString stringWithFormat:@"%@", version];
    
    // 比较两个版本的大小
    NSComparisonResult result = [self compareVersion:lastVersion to:newVersion];
    
    if (result != NSOrderedAscending)  return;
    
    // 升级内容描述
    content = [NSString stringWithFormat:@"<p style=\"font-size:16px;\">最新版本：<span style=\"font-size:20px; color:red;\">v%@</span></p><span style=\"font-size:14px;\">%@</span>", newVersion, (content ?: @"")];
    
    content = [content stringByReplacingOccurrencesOfString:@"\n" withString:@"<br>"];
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[content dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    
    /// 弹出 警告框
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"发现新版本\n\n" message:content preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVc setValue:attrStr forKeyPath:@"_attributedMessage"];
    
    // 点击取消
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"下次再说" style:UIAlertActionStyleDefault handler:NULL];
    
    // 点击确定
    UIAlertAction *enterAction = [UIAlertAction actionWithTitle:@"立即更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        // 跳转到 AppStore
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appURL]];
    }];
    
    [alertVc addAction:cancelAction];
    [alertVc addAction:enterAction];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertVc animated:YES completion:NULL];
}

#pragma mark - 🔒 👀 Privite Method 👀

/**
 比较两个版本号的大小
 
 @param v1 第一个版本号
 @param v2 第二个版本号
 */
+ (NSComparisonResult)compareVersion:(NSString *)v1 to:(NSString *)v2
{
    // 都为空，相等   (v1 == v2)
    if (!v1 && !v2) {
        return NSOrderedSame;
    }
    
    // v1为空，v2不为空  (v1 < v2)
    if (!v1 && v2) {
        return NSOrderedAscending;
    }
    
    // v2为空，v1不为空 (v1 < v2)
    if (v1 && !v2) {
        return NSOrderedDescending;
    }
    
    // 获取版本号字段
    NSArray *v1Array = [v1 componentsSeparatedByString:@"."];
    NSArray *v2Array = [v2 componentsSeparatedByString:@"."];
    // 取字段最少的，进行循环比较
    NSInteger smallCount = (v1Array.count > v2Array.count) ? v2Array.count : v1Array.count;
    
    for (int i = 0; i < smallCount; i++) {
        NSInteger value1 = [[v1Array objectAtIndex:i] integerValue];
        NSInteger value2 = [[v2Array objectAtIndex:i] integerValue];
        if (value1 > value2) {
            // v1版本字段大于v2版本字段
            return NSOrderedDescending;
        } else if (value1 < value2) {
            // v2版本字段大于v1版本字段
            return NSOrderedAscending;
        }
        
        // 版本相等，继续循环。
    }
    
    // 版本可比较字段相等，则字段多的版本高于字段少的版本。
    if (v1Array.count > v2Array.count) {
        return NSOrderedDescending;
    } else if (v1Array.count < v2Array.count) {
        return NSOrderedAscending;
    } else {
        return NSOrderedSame;
    }
    
    return NSOrderedSame;
}


@end
