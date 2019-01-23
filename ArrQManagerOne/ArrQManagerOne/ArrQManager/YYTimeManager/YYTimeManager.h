//
//  YYTimeManager.h
//  ArrQTool
//
//  Created by ArrQ on 2018/5/15.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  NS_ENUM(NSInteger ,bg_ShowStyle){
    
    bg_ShowStyleHms = 0,        // hh:mm:ss
    bg_ShowStyleMs             // mm:ss
    
};


@interface YYTimeManager : NSObject

+ (instancetype)shareManager;

#pragma mark 倒计时 验证码 ，方法 公用

- (void)getDaoJiShiWithTime:(NSInteger)times andFinishBlock:(void(^)(NSInteger times))FinishBlock;


# pragma mark --- 时分秒

- (void)getTimeHmsMoreWithSecond:(NSInteger)allTime andNetxSecond:(NSInteger)nextSecond andFinishingBlock:(void(^)(NSString *hhStr,NSString *minStr,NSString *secStr))FinishingBlock andNextSecondBlcok:(void(^)(NSInteger nextSecond))NextSecondBlcok andFinishCompleted:(void(^)(NSInteger lastSecond))FinishBlock;

# pragma mark --- 分秒

- (void)getMoreTimeMsWithSecond:(NSInteger)allTime andNetxSecond:(NSInteger)nextSecond andPlayingBlcok:(void(^)(NSString *minStr,NSString *secStr))PlayingBlcok andNextSecondBlcok:(void(^)(NSInteger nextSecond))NextSecondBlcok andFinishCompleted:(void(^)(NSInteger lastSecond))FinishBlock;



# pragma mark --- 格式 时分秒 ,分秒

/*
 type          显示 格式
 allTime       总时间 60s
 nextSecond    暂停时间
 */

- (void)getMoreTimeShowType:(bg_ShowStyle)type andSecond:(NSInteger)allTime andNetxSecond:(NSInteger)nextSecond andPlayingBlcok:(void(^)(NSString *hhStr,NSString *minStr,NSString *secStr))PlayingBlcok andNextSecondBlcok:(void(^)(NSInteger nextSecond))NextSecondBlcok andFinishCompleted:(void(^)(NSInteger lastSecond))FinishBlock;




@end
