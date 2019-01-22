//
//  YYNoticeView.h
//  YYTools
//
//  Created by admin on 2019/1/5.
//  Copyright © 2019年 ArrQ. All rights reserved.
//
/*   **************** 使用方法 ****************
 YYNoticeView *noticeView = [[YYNoticeView alloc] initWithFrame:CGRectMake(30, 100, self.view.frame.size.width - 30, 40) andScrollTimeInterval:2.0];
 [noticeView beginScrollWithDataArray:@[@"---0---",@"---1---",@"---2---",@"---3---",@"---4---"]];
 noticeView.backgroundColor = [UIColor redColor];
 [self.view addSubview:noticeView];
 noticeView.clickIndexBlock = ^void(NSInteger index){
 NSLog(@"点击了第%ld张", (long)index);
 };
 
 
 
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^totalBlock) (NSInteger);

@interface YYNoticeView : UIView
@property (nonatomic) NSInteger pageIndex;//开始滚动的索引
@property (nonatomic,strong) totalBlock clickIndexBlock;//返回点击的索引的索引
/**
 * 初始化  frame 和 滚动时间间隔
 */
-(instancetype)initWithFrame:(CGRect)frame andScrollTimeInterval:(NSTimeInterval)timeInterval;
/**
 *  开始滚动
 */
- (void)beginScrollWithDataArray:(NSArray *)array;
@end

NS_ASSUME_NONNULL_END
