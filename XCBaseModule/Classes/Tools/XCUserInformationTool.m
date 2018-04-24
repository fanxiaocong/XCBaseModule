//
//  XCUserInformationTool.m
//  AFNetworking
//
//  Created by 樊小聪 on 2018/4/24.
//

/*
 *  备注：用户信息工具类 🐾
 */

#import "XCUserInformationTool.h"
#import <XCMacros/XCMacros.h>


#define USER_INFORMATION_PATH    [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"UserInformation.data"]

static NSString *const AutoLoginKey    = @"AutoLoginKey";
static NSString *const UserAccountKey  = @"UserAccountKey";
static NSString *const UserPasswordKey = @"UserPasswordKey";
static NSString *const UserIdKey       = @"UserIdKey";


@implementation XCUserInformationTool

static id _instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (void)setLogin:(BOOL)login
{
    [USER_DEFAULTS setBool:login forKey:AutoLoginKey];
    [USER_DEFAULTS synchronize];
}

- (BOOL)isLogin
{
    return [USER_DEFAULTS boolForKey:AutoLoginKey];
}

- (void)setUserAccount:(NSString *)userAccount
{
    [USER_DEFAULTS setObject:userAccount forKey:UserAccountKey];
    [USER_DEFAULTS synchronize];
}

- (NSString *)userAccount
{
    return [USER_DEFAULTS objectForKey:UserAccountKey];
}

- (void)setUserPassword:(NSString *)userPassword
{
    [USER_DEFAULTS setObject:userPassword forKey:UserPasswordKey];
    [USER_DEFAULTS synchronize];
}

- (NSString *)userPassword
{
    return [USER_DEFAULTS objectForKey:UserPasswordKey];
}

- (void)setUserId:(NSString *)userId
{
    [USER_DEFAULTS setObject:userId forKey:UserIdKey];
    [USER_DEFAULTS synchronize];
}

- (NSString *)userId
{
    return [USER_DEFAULTS objectForKey:UserIdKey];
}

- (void)setUserInfo:(id<NSCoding>)userInfo
{
    [NSKeyedArchiver archiveRootObject:userInfo toFile:USER_INFORMATION_PATH];
}

- (id<NSCoding>)userInfo
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:USER_INFORMATION_PATH];
}

/**
 *  清空本地用户信息
 */
- (void)clearUserInfo
{
    if ([FILE_MANAGER fileExistsAtPath:USER_INFORMATION_PATH])
    {
        [FILE_MANAGER removeItemAtPath:USER_INFORMATION_PATH error:NULL];
    }
}


@end
