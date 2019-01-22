//
//  NSDate+BgDate.h
//  YYTools
//
//  Created by admin on 2019/1/19.
//  Copyright © 2019年 ArrQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (BgDate)

/**
 * 比较from和self的时间差值
 */
- (NSDateComponents *)getDateFrom:(NSDate *)from;

/**
 * 是否为今年
 */
- (BOOL)getIsThisYear;

/**
 * 是否为今天
 */
- (BOOL)getIsToday;

/**
 * 是否为昨天
 */
- (BOOL)getIsYesterday;

/**
 * 获取当前时间戳(TimeStr),时间(Time)
 */
+ (NSString *)getCurrent_TimeStr_10;
+ (NSString *)getCurrent_TimeStr_13;

+ (NSString *)getCurrent_Time_10;
+ (NSString *)getCurrent_Time_13;

/**
 * 时间 < -  时间戳 , 时间戳 < -  时间 yyyy-MM-dd HH:mm
 */
+ (NSString *)getTimeWithTimeStr_10:(NSString *)timeStr_10 toTimeStrWithFormat:(NSString *)format;
+ (NSString *)getTimeWithTimeStr_13:(NSString *)timeStr_13 toTimeStrWithFormat:(NSString *)format;

+ (NSString *)getTimeStr_10WithTime:(NSString *)timeStr_10 andTimeFormat:(NSString *)format;
+ (NSString *)getTimeStr_13WithTime:(NSString *)timeStr_13 andTimeFormat:(NSString *)format;




@end

NS_ASSUME_NONNULL_END
