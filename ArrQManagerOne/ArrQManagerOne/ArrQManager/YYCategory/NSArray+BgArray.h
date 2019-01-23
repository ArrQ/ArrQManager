//
//  NSArray+BgArray.h
//  ArrQManagerOne
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019年 ArrQ. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (BgArray)

// 数组中 最值计算
+ (NSString *)getAllMaxWithArray:(NSArray *)arr;
+ (NSString *)getAllMinWithArray:(NSArray *)arr;
+ (NSString *)getAllSumWithArray:(NSArray *)arr;


// 直接取反
+ (NSArray *)getAllFanWithArray:(NSArray *)arr;

// 数组排序方法（升序,降序）
+ (NSArray *)getAllUpNumArrayWithArray:(NSArray *)arr;
+ (NSArray *)getAllDownNumArrayWithArray:(NSArray *)arr;

// 字符串 =》 数组
+ (NSArray *)getArrayWithString:(NSString *)oneStr;
// 数组 =》 字符串
+ (NSString *)getStrWithArray:(NSArray *)dataArray;

//数组中 任意两位数的（和,差） 算法
+ (NSArray *)getAllNumAnyTwoHeWithArray:(NSArray *)data;
+ (NSArray *)getAllNumAnyTwoChaWithArray:(NSArray *)data;

@end

NS_ASSUME_NONNULL_END
