//
//  NSObject+XCLog.m
//  Pods-XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/4/20.
//

#import "NSObject+XCLog.h"

@implementation NSArray (XCLog)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    [strM appendString:@")"];
    return strM;
}
@end


@implementation NSDictionary (XCLog)
- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    [strM appendString:@"}\n"];
    return strM;
}
@end
