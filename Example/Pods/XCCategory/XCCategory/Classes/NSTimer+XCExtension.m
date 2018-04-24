//
//  NSTimer+XCExtension.m
//  XCCategoryExample
//
//  Created by 樊小聪 on 2018/2/28.
//  Copyright © 2018年 樊小聪. All rights reserved.
//

#import "NSTimer+XCExtension.h"

@implementation NSTimer (XCExtension)

#pragma mark - 🔓 👀 Public Method 👀

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds
                                      block:(void (^)(NSTimer *timer))block
                                    repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:seconds
                                         target:self
                                       selector:@selector(_xc_ExecBlock:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}


+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds
                             block:(void (^)(NSTimer *timer))block
                           repeats:(BOOL)repeats
{
    return [self timerWithTimeInterval:seconds
                                target:self
                              selector:@selector(_xc_ExecBlock:)
                              userInfo:[block copy]
                               repeats:repeats];
}

#pragma mark - 🔒 👀 Privite Method 👀

+ (void)_xc_ExecBlock:(NSTimer *)timer
{
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = (void (^)(NSTimer *timer))[timer userInfo];
        block(timer);
    }
}

@end
