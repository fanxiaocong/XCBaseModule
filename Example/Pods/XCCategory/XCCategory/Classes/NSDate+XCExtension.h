//
//  NSDate+XCExtension.h
//  常用分类
//
//  Created by 樊小聪 on 2017/2/24.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (XCExtension)

/**
 *  是否为今天
 */
- (BOOL)isToday;
/**
 *  是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  是否为今年
 */
- (BOOL)isThisYear;

/**
 *  是否是明天
 */
- (BOOL)isTomorrow;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)dateWithYMD;

/**
 *  获得与当前时间的差距
 */
- (NSDateComponents *)deltaWithNow;

/**
 *  返回 years 年之后的时间
 */
- (NSDate *)dateByAddingYears:(NSInteger)years;

/**
 *  返回 months 月之后的时间
 */
- (NSDate *)dateByAddingMonths:(NSInteger)months;

/**
 *  返回 weeks 周之后的时间
 */
- (NSDate *)dateByAddingWeeks:(NSInteger)weeks;

/**
 *  返回 days 天之后的时间
 */
- (NSDate *)dateByAddingDays:(NSInteger)days;

/**
 *  返回 hours 小时之后的时间
 */
- (NSDate *)dateByAddingHours:(NSInteger)hours;

/**
 *  返回 minutes 分钟之后的时间
 */
- (NSDate *)dateByAddingMinutes:(NSInteger)minutes;

/**
 *  返回 seconds 秒之后的时间
 */
- (NSDate *)dateByAddingSeconds:(NSInteger)seconds;

@end
