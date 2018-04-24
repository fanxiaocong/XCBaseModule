//
//  NSString+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/27.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XCExtension)

/**
 *  返回 当前设备的 UUID
 */
+ (NSString *)stringWithUUID;

/**
 *  返回当前设备连接的 IP地址
 */
+ (NSString *)stringWithIP;


/**
 *  将数字字符串按照千位分隔，并保留两位小数：1999.33 ---> 1,999.33；1009 ---> 1009.00
 */
- (NSString *)thousandSeparatorString;

@end
