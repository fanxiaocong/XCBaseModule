//
//  NSDictionary+XCExtension.h
//  XCCategoryExample
//
//  Created by 樊小聪 on 2018/2/28.
//  Copyright © 2018年 樊小聪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (XCExtension)

/**
 *  返回字典所有的key，并且升序排列
 */
- (NSArray<NSString *> *)allSortedKeys;

/**
 *  返回所有的value，并且根据key的升序进行排列
 */
- (NSArray *)allValuesBySortedKeys;

/**
 *  将字典转化为json字符串
 */
- (NSString *)toJsonString;

@end
