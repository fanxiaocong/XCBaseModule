//
//  NSDictionary+XCExtension.m
//  XCCategoryExample
//
//  Created by 樊小聪 on 2018/2/28.
//  Copyright © 2018年 樊小聪. All rights reserved.
//

#import "NSDictionary+XCExtension.h"

@implementation NSDictionary (XCExtension)

- (NSArray<NSString *> *)allSortedKeys
{
    return [[self allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *)allValuesBySortedKeys
{
    NSArray *sortedKeys = [self allSortedKeys];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (id key in sortedKeys) {
        [arr addObject:self[key]];
    }
    return [arr copy];
}

- (NSString *)toJsonString
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (!error) return json;
    }
    return nil;
}


@end
