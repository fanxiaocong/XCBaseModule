//
//  NSString+XCExtension.m
//  常用分类
//
//  Created by 樊小聪 on 2017/2/27.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "NSString+XCExtension.h"

#import <ifaddrs.h>
#import <arpa/inet.h>

@implementation NSString (XCExtension)

+ (NSString *)stringWithUUID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string;
}

+ (NSString *)stringWithIP{
    NSString *address = @"Not Found";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    success = getifaddrs(&interfaces);
    if (success == 0) {
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    freeifaddrs(interfaces);
    return address;
}

/**
 *  将数字字符串按照千位分隔，并保留两位小数：1999.33 ---> 1,999.33；1009 ---> 1009.00
 */
- (NSString *)thousandSeparatorString
{
    if (0 == self.length)   return self;
    
    /**
     *  1. 将字符串替换成统一的带有两个小数点的样式：100.00
     *  2. 按照 . 将字符串分隔成一个数组： @[100, 00]
     *  3. 取出整数部分（数组的第一个元素进行判断），从右向左每隔三位补 ,
     */
    
    NSString *str = self;
    
    /// 1. 将字符串替换成统一的带有两个小数点的样式：100.00
    if (![str containsString:@"."])
    {
        str = [NSString stringWithFormat:@"%@.00", str];
    }
    
    /// 2. 按照 . 将字符串分隔成一个数组： @[100, 00]
    NSArray *tempArr = [str componentsSeparatedByString:@"."];
    
    /// 3. 取出整数部分进行判断
    NSString *integerStr = tempArr.firstObject;
    
    /// 3.1 标记 "," 的位置
    NSInteger commaLocation = integerStr.length;
    
    /// 3.2 存取每段字符串 从右到左的顺序添加
    NSMutableArray *reverseComponentsArr = [NSMutableArray array];
    
    while (commaLocation > 3)
    {
        /// 3.3 截取每段字符串的范围
        NSRange componentRange = NSMakeRange(commaLocation-3, 3);
        NSString *component = [integerStr substringWithRange:componentRange];
        [reverseComponentsArr addObject:component];
        
        commaLocation -= 3;
    }
    
    /// 3.4 将最前面不足千位的的部分添加进数组
    NSRange firstRange = NSMakeRange(0, commaLocation);
    [reverseComponentsArr addObject:[integerStr substringWithRange:firstRange]];
    
    /// 3.5 目前数组中的元素是按 从左到右 的顺序添加进去的，要反序
    NSMutableArray *componentsArr = [NSMutableArray array];
    NSInteger count = reverseComponentsArr.count;
    for (NSInteger index = count-1; index >= 0; index --)
    {
        NSString *component = reverseComponentsArr[index];
        [componentsArr addObject:component];
    }
    
    /// 3.6 将数组拼接成字符串
    // 3.6.1 部分字符串
    integerStr = [componentsArr componentsJoinedByString:@","];
    
    // 3.6.2 小数部分字符串
    NSString *floatStr = tempArr.lastObject;
    
    // 3.6.3 拼接
    NSString *resultStr = [NSString stringWithFormat:@"%@.%@", integerStr, floatStr];
    
    return resultStr;
}


@end
