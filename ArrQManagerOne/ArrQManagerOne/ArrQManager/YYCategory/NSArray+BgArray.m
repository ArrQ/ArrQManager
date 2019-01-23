//
//  NSArray+BgArray.m
//  ArrQManagerOne
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019年 ArrQ. All rights reserved.
//

#import "NSArray+BgArray.h"

@implementation NSArray (BgArray)


// 数组中 最值==最大

+ (NSString *)getAllMaxWithArray:(NSArray *)arr{
    
    NSNumber *max = [arr valueForKeyPath:@"@max.floatValue"];
    NSString *str_max = [NSString stringWithFormat:@"%@",max];
    return str_max;
    
}


// 数组中 最值==最小

+ (NSString *)getAllMinWithArray:(NSArray *)arr{
    
    NSNumber *min = [arr valueForKeyPath:@"@min.floatValue"];
    NSString *str_min = [NSString stringWithFormat:@"%@",min];

    return str_min;
    
}
// 数组中 最值==总和

+ (NSString *)getAllSumWithArray:(NSArray *)arr{
    
    NSNumber *hezhi = [arr valueForKeyPath:@"@sum.floatValue"];
    NSString *str_hezhi = [NSString stringWithFormat:@"%@",hezhi];

    return str_hezhi;
    
    
}

// 直接取反
+ (NSArray *)getAllFanWithArray:(NSArray *)arr{
    
    NSArray *arrOne = [[arr reverseObjectEnumerator] allObjects];
    
    return arrOne;
    
}


#pragma mark -- 数组排序方法（升序）

+ (NSArray *)getAllUpNumArrayWithArray:(NSArray *)arr{
    
    NSArray *arr_Up = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
    
        return [obj1 compare:obj2]; 
        
    }];
    
    return arr_Up;
    
    
}

# pragma mark ---  数组排序方法（降序）

+ (NSArray *)getAllDownNumArrayWithArray:(NSArray *)arr{
    
    NSArray *arr_Up = [arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        return [obj1 compare:obj2];
        
    }];
    
    NSArray *arr_down = [[arr_Up reverseObjectEnumerator] allObjects];

    return arr_down;
    
    
}



# pragma mark ---  字符串 =》 数组
+ (NSArray *)getArrayWithString:(NSString *)oneStr{
    
    //    这里只区别 中英文 逗号,下划线,空格 === 针对  1位 占位符 处理
    NSMutableArray *dataArray = [NSMutableArray array];
    
    if ([oneStr containsString:@","]) {
        
        [dataArray addObject:[oneStr stringByReplacingOccurrencesOfString:@"," withString:@","]];
        
    }else if ([oneStr containsString:@"，"]){
        
        
        [dataArray addObject:[oneStr stringByReplacingOccurrencesOfString:@"，" withString:@","]];
        
        
    }else if ([oneStr containsString:@" "]){
        
        [dataArray addObject:[oneStr stringByReplacingOccurrencesOfString:@" " withString:@","]];
        
        
        
    }else if ([oneStr containsString:@"_"]){
        
        
        [dataArray addObject:[oneStr stringByReplacingOccurrencesOfString:@"_" withString:@","]];
        
        
    }else{
        
        for (int i = 0; i<oneStr.length; i++) {
            
            [dataArray addObject:[oneStr substringWithRange:NSMakeRange(i, 1)]];
            
            
        }
        
        
        
    }
    
    return dataArray;
    
    
}



# pragma mark --- 数组 =》 字符串
+ (NSString *)getStrWithArray:(NSArray *)dataArray{
    
    NSString *oneStr;
    
    oneStr = [dataArray componentsJoinedByString:@","];
    
    return oneStr;
    
    
}



# pragma mark --- 数组中 任意两位数的和的 算法

+ (NSArray *)getAllNumAnyTwoHeWithArray:(NSArray *)data{
    
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *arrayall = [NSMutableArray array];
    
    NSString *stralllll ;
    for (NSString *strone in data) {
        
        for (NSString *strtwo in data) {
            
            if (![strone isEqualToString:strtwo]) {
                
                NSInteger all = [strone integerValue] + [strtwo integerValue];
                stralllll = [NSString stringWithFormat:@"%ld",all];
                [array addObject:stralllll];
               
            }
            
        }
        
        
    }
    
    NSLog(@"=======%@",array);
    [arrayall addObjectsFromArray:array];
    
    return arrayall;
    
    
}



# pragma mark --- 任意两位数的差的 算法

+ (NSArray *)getAllNumAnyTwoChaWithArray:(NSArray *)data{
    
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *arrayall = [NSMutableArray array];
    
    NSString *stralllll ;
    for (NSString *strone in data) {
        
        for (NSString *strtwo in data) {
            
            if (![strone isEqualToString:strtwo]) {
                
                NSInteger all = [strone integerValue] - [strtwo integerValue];
                
                all = labs(all);// 取绝对值
                stralllll = [NSString stringWithFormat:@"%ld",all];
                
                [array addObject:stralllll];
                
            }
            
            
        }
        
        
    }
    
    NSLog(@"=======%@",array);
    [arrayall addObjectsFromArray:array];
    
    return arrayall;
    
    
}

# pragma mark --- 提取 数组中 相同 元素

+ (NSArray *)getNumCommonFromArrayWithArray:(NSArray *)dataArray andNewArray:(NSArray *)newArray{
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (NSString *strone in dataArray) {
        
        if (![newArray containsObject:strone]) {// 数组中是已知对象 如果是 字典等，就不好玩了，
            
            [resultArray addObject:strone];
            
        }
        
    }
    
    
    
    return resultArray;
    
}


# pragma mark --- 提取 数组中 的  元素 是否包含 另一个 数组的  元素

+ (NSArray *)getIsContainStrOne:(NSArray *)arrA andArrB:(NSArray *)arrB{
    
    
    
//    NSArray *arrA = @[@"2345", @"5678", @"7893", @"4567",@"9999"];
//
//    NSArray *arrB = @[@"23", @"56"];
//
    
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSString *strA in arrA) {
        
        
        __block BOOL isContain = NO;
        
        NSInteger index = 0;
        
        while (isContain == NO && index<arrB.count) { // isContain 这里的判断 条件很重要
            
            BOOL isContainStrB = YES;
            
            NSInteger i = 0;
            
            NSString *strB = arrB[index];
            
            while (isContainStrB == YES && i<strB.length) {// isContainStrB 这里的判断 条件很重要
                
                isContainStrB = [strA containsString:[strB substringWithRange:NSMakeRange(i, 1)]];
                
                i++;
                
            }
            
            isContain = isContainStrB;// yes 说明 23 都包含
            
            index ++;
            
        }
       
        if (!isContain) { // 这里取反 取的不是第一个奥
            
            [result addObject:strA];
            
        }
        
        
        
        
        
    }
    
    
    NSLog(@"====== 结果值：%@",result);// 1234 里面的元素 是否同时 有 23，或则 56
    
    
    return result;
    
}

@end
