//
//  UIApplication+XCExtension.m
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：关于 App 信息的分类 🐾
 */


#import "UIApplication+XCExtension.h"

#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>


#define iOS8_OR_LATER ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
#define iOS9_OR_LATER ([UIDevice currentDevice].systemVersion.floatValue >= 9.0)

@implementation UIApplication (XCExtension)

/** 👀 沙盒中 Documents 的全路径 👀 */
- (NSString *)documentsPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

/** 👀 沙盒中 Caches 的全路径 👀 */
- (NSString *)cachesPath
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

/** 👀 沙盒中 Library 的全路径 👀 */
- (NSString *)libraryPath
{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

/** 👀 App 的 BundleName 👀 */
- (NSString *)appBundleName
{
    return [self fetchAppBundleInfoValueForKey:@"CFBundleName"];
}

/** 👀 App 的 BundleID 👀 */
- (NSString *)appBundleID
{
    return [self fetchAppBundleInfoValueForKey:@"CFBundleIdentifier"];
}

/** 👀 App 的 BundelVersion(Build 版本号) 👀 */
- (NSString *)appBundleVersion
{
    return [self fetchAppBundleInfoValueForKey:@""];
}

/** 👀 App 的 appBundleShortVersion(Version 版本号) 👀 */
- (NSString *)appBundleShortVersion
{
    return [self fetchAppBundleInfoValueForKey:@"CFBundleShortVersionString "];
}

/** 👀 App 展示的名称 👀 */
- (NSString *)appDisplayName
{
    return [self fetchAppBundleInfoValueForKey:@"CFBundleDisplayName"];
}



/**
 获取 App 相关的信息

 @param key Key 值
 */
- (NSString *)fetchAppBundleInfoValueForKey:(NSString *)key
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:key];
}

/* 🐖 ***************************** 🐖 华丽的分隔线 🐖 *****************************  🐖 */

- (BOOL)canUsePhotoAlbum
{
    if (iOS9_OR_LATER)
    {
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        return (status == PHAuthorizationStatusAuthorized   ||
                status == PHAuthorizationStatusNotDetermined);
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    ALAuthorizationStatus status = [ALAssetsLibrary authorizationStatus];
    return (status == ALAuthorizationStatusAuthorized  ||
            status == ALAuthorizationStatusNotDetermined);
#pragma clang diagnostic pop
    
    return NO;
}

- (BOOL)canUseCamera
{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    return (status == AVAuthorizationStatusNotDetermined    ||
            status == AVAuthorizationStatusAuthorized);
}

- (BOOL)canUseAudio
{
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    return (status == AVAuthorizationStatusNotDetermined    ||
            status == AVAuthorizationStatusAuthorized);
}

- (BOOL)canUseAddressBook
{
    if (iOS9_OR_LATER)
    {
        CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
        return (status == CNAuthorizationStatusAuthorized   ||
                status == CNAuthorizationStatusNotDetermined);
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    ABAuthorizationStatus status = ABAddressBookGetAuthorizationStatus();
    return (status == kABAuthorizationStatusAuthorized  ||
            status == kABAuthorizationStatusNotDetermined);
#pragma clang diagnostic pop
}

/* 🐖 ***************************** 🐖 Method 🐖 *****************************  🐖 */

/**
 播放系统声音
 */
- (void)playSystemSound
{
    AudioServicesPlaySystemSound(1007);
}

/**
 振动
 */
- (void)vibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

/**
 播放声音和振动
 */
- (void)playSoundAndVibrate
{
    [self playSystemSound];
    [self vibrate];
}


@end








































