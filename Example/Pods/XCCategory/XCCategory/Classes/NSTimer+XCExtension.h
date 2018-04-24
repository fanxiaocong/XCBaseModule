//
//  NSTimer+XCExtension.h
//  XCCategoryExample
//
//  Created by 樊小聪 on 2018/2/28.
//  Copyright © 2018年 樊小聪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (XCExtension)

/**
 *  开启一个定时器，并自动加入当前的 run loop 中
 *
 *  @param seconds  定时的时间间隔
 *  @param block    回调
 *  @param repeats  是否重复执行
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds
                                      block:(void (^)(NSTimer *timer))block
                                    repeats:(BOOL)repeats;

/**
 *  开启一个定时器，需要手动加入当前的 run loop 中
 *
 *  @param seconds  定时的时间间隔
 *  @param block    回调
 *  @param repeats  是否重复执行
 */
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds
                             block:(void (^)(NSTimer *timer))block
                           repeats:(BOOL)repeats;

@end
