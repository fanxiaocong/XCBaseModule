//
//  XCUserInformationTool.h
//  AFNetworking
//
//  Created by 樊小聪 on 2018/4/24.
//


/*
 *  备注：用户信息工具类 🐾
 */


#import <UIKit/UIKit.h>

@interface XCUserInformationTool : NSObject

/** 用户登录状态 */
@property (nonatomic, getter=isLogin, assign) BOOL login;
/** 用户登录账号 即手机号 */
@property (nonatomic, copy) NSString *userAccount;
/** 👀 用户登录密码 👀 */
@property (nonatomic, copy) NSString *userPassword;
/** 👀 用户数据模型 👀 */
@property (strong, nonatomic) id<NSCoding> userInfo;


+ (instancetype)shareInstance;

/**
 *  清空本地用户信息
 */
- (void)clearUserInfo;

@end
