//
//  YYTimeManager.m
//  ArrQTool
//
//  Created by ArrQ on 2018/5/15.
//  Copyright © 2018年 ArrQ. All rights reserved.
//

#import "YYTimeManager.h"

@interface YYTimeManager (){
    
    dispatch_source_t _timerOne;
    NSInteger times;

}




@end



@implementation YYTimeManager

+ (instancetype)shareManager{
    
    static YYTimeManager *manager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        manager = [[YYTimeManager alloc]init];
       
    });
    
    return manager;
}

#pragma mark 倒计时 验证码 ，方法
- (void)getDaoJiShiWithTimerOne:(dispatch_source_t)timerOne andTime:(NSInteger)times andFinishBlock:(void (^)(NSInteger))FinishBlock{
    
    if (times > 0) {
        return;
    }
    
    timerOne = nil;
    __block NSInteger second = times;
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    timerOne = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    dispatch_source_set_timer(timerOne, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
    dispatch_source_set_event_handler(timerOne, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second >= 0) {
                
                FinishBlock(second);
                
                second--;
            }
            else
            {
                dispatch_source_cancel(timerOne);
                
            }
            
        });
        
    });
    dispatch_resume(timerOne);
   
    
}

# pragma mark --- 时分秒

- (void)getTimeHmsMoreWithTimerOne:(dispatch_source_t)timerOne andSecond:(NSInteger)allTime andNetxSecond:(NSInteger)nextSecond andFinishingBlock:(void (^)(NSString *, NSString *, NSString *))FinishingBlock andNextSecondBlcok:(void (^)(NSInteger))NextSecondBlcok andFinishCompleted:(void (^)(NSInteger))FinishBlock{
    
    
    if (allTime > 0) {
        return;
    }
    
    __block NSInteger second = allTime;
    __block NSInteger YYnextSecond = 0;
    
    timerOne = nil;
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    timerOne = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    
    dispatch_source_set_timer(timerOne, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
    dispatch_source_set_event_handler(timerOne, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second >= 0) {
                
                NSInteger hhNum = second/3600;
                long MinNum = (second%3600)/60;
                long SecNum = second%60;
                
                NSString * hh;
                NSString * M;
                NSString * S;
                
                if (hhNum<10)
                {
                    hh = [NSString stringWithFormat:@"0%@",@(hhNum)];
                }else
                {
                    hh = [NSString stringWithFormat:@"%@",@(hhNum)];
                }
                if (MinNum<10)
                {
                    M = [NSString stringWithFormat:@"0%ld",MinNum];
                }else
                {
                    M = [NSString stringWithFormat:@"%ld",MinNum];
                }
                if (SecNum<10)
                {
                    S = [NSString stringWithFormat:@"0%ld",SecNum];
                }else
                {
                    S = [NSString stringWithFormat:@"%ld",SecNum];
                }
                
                
                FinishingBlock(hh,M,S);
                
                
                if(second == 0){
                    
                    FinishBlock(second);
                    
                }
                
                
                second--;
                
                YYnextSecond++;
                
                if(YYnextSecond == nextSecond){
                    
                    NextSecondBlcok(YYnextSecond);
                    
                }
                
                
            }
            else
            {
                //这句话必须写否则会出问题
                dispatch_source_cancel(timerOne);
                
            }
        });
        
    });
    //启动源
    dispatch_resume(timerOne);
    
}



# pragma mark --- 分秒

- (void)getMoreTimeMsWithTimerOne:(dispatch_source_t)timerOne andSecond:(NSInteger)allTime andNetxSecond:(NSInteger)nextSecond andPlayingBlcok:(void (^)(NSString *, NSString *))PlayingBlcok andNextSecondBlcok:(void (^)(NSInteger))NextSecondBlcok andFinishCompleted:(void (^)(NSInteger))FinishBlock{
    
    if (allTime > 0) {
        return;
    }
    __block NSInteger YYnextSecond = 0;
    
    __block NSInteger second = allTime;
    timerOne = nil;
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    timerOne = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    
    dispatch_source_set_timer(timerOne, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
    dispatch_source_set_event_handler(timerOne, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (second >= 0) {
                
                //计算分秒
                long MinNum = second/60;
                long SecNum = second%60;
                
                NSString * M;
                NSString * S;
                
                
                if (MinNum<10)
                {
                    M = [NSString stringWithFormat:@"0%ld",MinNum];
                }else
                {
                    M = [NSString stringWithFormat:@"%ld",MinNum];
                }
                if (SecNum<10)
                {
                    S = [NSString stringWithFormat:@"0%ld",SecNum];
                }else
                {
                    S = [NSString stringWithFormat:@"%ld",SecNum];
                }
                
                PlayingBlcok(M,S);
                
                if(second == 0){
                    
                    FinishBlock(second);
                    
                }
                
                second--;
                
                YYnextSecond++;
                
                if(YYnextSecond == nextSecond){
                    
                    NextSecondBlcok(YYnextSecond);
                    
                }
                
            }
            else
            {
                //这句话必须写否则会出问题
                dispatch_source_cancel(timerOne);
                
            }
        });
        
    });
    //启动源
    dispatch_resume(timerOne);
    
    
    
    
    
}



# pragma mark --- 区别 时分秒 和 分秒

- (void)getMoreTimeShowType:(bg_ShowStyle)type andTimerOne:(dispatch_source_t)timerOne andSecond:(NSInteger)allTime andNetxSecond:(NSInteger)nextSecond andPlayingBlcok:(void (^)(NSString *, NSString *, NSString *))PlayingBlcok andNextSecondBlcok:(void (^)(NSInteger))NextSecondBlcok andFinishCompleted:(void (^)(NSInteger))FinishBlock{
    
    
    if (allTime > 0) {
        return;
    }
    __block NSInteger YYnextSecond = 0;
    
    __block NSInteger second = allTime;
    
    timerOne = nil;
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    timerOne = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    
    dispatch_source_set_timer(timerOne, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
    dispatch_source_set_event_handler(timerOne, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second >= 0) {
                
                
                NSInteger hhNum ;
                long MinNum ;
                long SecNum ;
                
                if(type == 0){
                    
                    hhNum = second/3600;
                    MinNum = (second%3600)/60;
                    SecNum = second%60;
                    NSString * hh;
                    NSString * M;
                    NSString * S;
                    
                    if (hhNum<10)
                    {
                        hh = [NSString stringWithFormat:@"0%@",@(hhNum)];
                    }else
                    {
                        hh = [NSString stringWithFormat:@"%@",@(hhNum)];
                    }
                    if (MinNum<10)
                    {
                        M = [NSString stringWithFormat:@"0%ld",MinNum];
                    }else
                    {
                        M = [NSString stringWithFormat:@"%ld",MinNum];
                    }
                    if (SecNum<10)
                    {
                        S = [NSString stringWithFormat:@"0%ld",SecNum];
                    }else
                    {
                        S = [NSString stringWithFormat:@"%ld",SecNum];
                    }
                    
                    
                    PlayingBlcok(hh,M,S);
                    
                    
                }else if (type ==1 ){
                    
                    //计算分秒
                    MinNum = second/60;
                    SecNum = second%60;
                    
                    
                    
                    
                    NSString * M;
                    NSString * S;
                    
                    
                    if (MinNum<10)
                    {
                        M = [NSString stringWithFormat:@"0%ld",MinNum];
                    }else
                    {
                        M = [NSString stringWithFormat:@"%ld",MinNum];
                    }
                    if (SecNum<10)
                    {
                        S = [NSString stringWithFormat:@"0%ld",SecNum];
                    }else
                    {
                        S = [NSString stringWithFormat:@"%ld",SecNum];
                    }
                    
                    
                    PlayingBlcok(nil,M,S);
                    
                    
                    
                }
                
                
                if(second == 0){
                    
                    FinishBlock(second);
                    
                }
                
                
                second--;
                
                
                if(YYnextSecond == nextSecond){
                    
                    NextSecondBlcok(YYnextSecond);
                    
                }
                
                
                
            }
            else
            {
                //这句话必须写否则会出问题
                dispatch_source_cancel(timerOne);
                
            }
        });
        
    });
    //启动源
    dispatch_resume(timerOne);
    
    
    
    
    
}






#pragma mark

// 分秒
- (NSString *)getTimeFormateWithMinSec:(long)AllTimeNum{
    
    NSString *timeStr;
    
    //计算分秒
    long minNUm = AllTimeNum/60;
    long secNum = AllTimeNum%60;
    
    timeStr = [self getChangeFenMiaoWithMinSec:minNUm andSec:secNum];
    
    
    return timeStr;
    
    
}

// 时分秒
- (NSString *)getTimeFormateWithAllTimeSec:(long)AllTimeNum{
    
    NSString *timeStr;
    
    NSInteger hhNUm = AllTimeNum/3600;
    long MinNum = (AllTimeNum%3600)/60;
    long SecNum = AllTimeNum%60;
    
    
    timeStr = [self getChangeShiFenMiaoWithHh:hhNUm andMin:MinNum andSec:SecNum];
    
    
    return timeStr;
    
    
}



// 返回 时分秒

- (NSString *)getChangeShiFenMiaoWithHh:(long)hhNum andMin:(long)MinNum andSec:(long)SecNum{
    
    
    NSString *allTime;
    
    NSString *hh;
    NSString * M;
    NSString * S;
    
    if (hhNum<10)
    {
        hh = [NSString stringWithFormat:@"0%@",@(hhNum)];
    }else
    {
        hh = [NSString stringWithFormat:@"%@",@(hhNum)];
    }
    if (MinNum<10)
    {
        M = [NSString stringWithFormat:@"0%ld",MinNum];
    }else
    {
        M = [NSString stringWithFormat:@"%ld",MinNum];
    }
    if (SecNum<10)
    {
        S = [NSString stringWithFormat:@"0%ld",SecNum];
    }else
    {
        S = [NSString stringWithFormat:@"%ld",SecNum];
    }
    allTime = [NSString stringWithFormat:@"%@'%@“%@",hh,M,S];
    
    return allTime;
    
    
}


- (void)getMoreChangeShiFenMiaoWith:(long)AllTimeNum andFinishBlock:(void(^)(NSString *,NSString *,NSString *))FinishBlock{
    
    NSInteger hhNum = AllTimeNum/3600;
    long MinNum = (AllTimeNum%3600)/60;
    long SecNum = AllTimeNum%60;
    
    NSString * hh;
    NSString * M;
    NSString * S;
    
    if (hhNum<10)
    {
        hh = [NSString stringWithFormat:@"0%@",@(hhNum)];
    }else
    {
        hh = [NSString stringWithFormat:@"%@",@(hhNum)];
    }
    if (MinNum<10)
    {
        M = [NSString stringWithFormat:@"0%ld",MinNum];
    }else
    {
        M = [NSString stringWithFormat:@"%ld",MinNum];
    }
    if (SecNum<10)
    {
        S = [NSString stringWithFormat:@"0%ld",SecNum];
    }else
    {
        S = [NSString stringWithFormat:@"%ld",SecNum];
    }
    
    FinishBlock(hh,M,S);
    
    
}

// 返回 分秒

- (NSString *)getChangeFenMiaoWithMinSec:(long)MinNum andSec:(long)SecNum{
    
    
    NSString *allTime;
    
    NSString * M;
    NSString * S;
    
    
    if (MinNum<10)
    {
        M = [NSString stringWithFormat:@"0%ld",MinNum];
    }else
    {
        M = [NSString stringWithFormat:@"%ld",MinNum];
    }
    if (SecNum<10)
    {
        S = [NSString stringWithFormat:@"0%ld",SecNum];
    }else
    {
        S = [NSString stringWithFormat:@"%ld",SecNum];
    }
    allTime = [NSString stringWithFormat:@"'%@“%@",M,S];
    
    return allTime;
    
    
}



@end
