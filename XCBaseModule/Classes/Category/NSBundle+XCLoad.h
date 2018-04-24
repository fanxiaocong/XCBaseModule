//
//  NSBundle+XCLoad.h
//  Pods-XCBaseModule_Example
//
//  Created by 樊小聪 on 2018/4/20.
//

#import <Foundation/Foundation.h>

@interface NSBundle (XCLoad)

/**
 *  加载 bundle
 *
 *  @param cls      bundle所在的类
 *  @param name     bundle名称
 */
+ (instancetype)bundleForClass:(Class)cls
                          name:(NSString *)name;

@end
