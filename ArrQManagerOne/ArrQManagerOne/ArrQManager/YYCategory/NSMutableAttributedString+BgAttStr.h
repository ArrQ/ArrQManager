//
//  NSMutableAttributedString+BgAttStr.h
//  YYTools
//
//  Created by admin on 2019/1/21.
//  Copyright © 2019年 ArrQ. All rights reserved.
//
//NSFontAttributeName               字号 UIFont
//NSParagraphStyleAttributeName     段落样式  NSParagraphStyle
//NSForegroundColorAttributeName    前景色   UIColor
//NSBackgroundColorAttributeName    背景色   UIColor
//NSObliquenessAttributeName        字体倾斜     NSNumber
//NSExpansionAttributeName          字体加粗     NSNumber  比例 0就是不变 1增加一倍
//NSKernAttributeName               字间距   CGFloat
//NSUnderlineStyleAttributeName     下划线     1或0
//NSUnderlineColorAttributeName     下划线颜色

//NSStrikethroughStyleAttributeName 删除线   NSUnderlineStyleNone 不设置删除线    NSUnderlineStyleSingle 设置删除线为细单实线 NSUnderlineStyleThick 设置删除线为粗单实线NSUnderlineStyleDouble 设置删除线为细双实线

//NSStrikethroughColorAttributeName 某种颜色
//NSStrokeColorAttributeName        same as ForegroundColor
//NSStrokeWidthAttributeName        CGFloat
//NSLigatureAttributeName           连笔字取值为NSNumber对象
//NSShadowAttributeName             阴影    NSShawdow
//NSTextEffectAttributeName         设置文本特殊效果，取值为 NSString 对象，目前只有图版印刷效果可用：
//NSAttachmentAttributeName         NSTextAttachment  设置文本附件,常用插入图片
//NSLinkAttributeName               链接  NSURL (preferred) or NSString
//NSBaselineOffsetAttributeName     基准线偏移   NSNumber
//NSWritingDirectionAttributeName   文字方向     @[@(1),@(2)]  分别代表不同的文字出现方向等等，我想你一定用不到它 - -
//NSVerticalGlyphFormAttributeName  水平或者竖直文本  1竖直 0水平 在iOS没卵用，不支持竖版

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (BgAttStr)

- (void)getSetColor:(UIColor *)color range:(NSRange)range;
- (void)getSetFont:(UIFont *)font range:(NSRange)range;
- (void)getSetUnderline:(NSRange)range;


#pragma mark - 一句话中的某些字的颜色（多种颜色）

// 两种 颜色
+(NSMutableAttributedString *)getTwoTextColorWithColor:(UIColor *)color string:(NSString *)str andSubString:(NSArray *)subStringArr andTwoString:(NSArray *)TwoString  andTwoColor:(UIColor *)TwoColor;


+(NSMutableAttributedString *)getMoreTextColorWithColor:(UIColor *)color string:(NSString *)str andSubString:(NSArray *)subStringArr andTwoString:(NSArray *)TwoString andThreeString:(NSArray *)ThreeString andForthString:(NSArray *)ForthString andFifthString:(NSArray *)FifthString andTwoColor:(UIColor *)TwoColor andThreeColor:(UIColor *)ThreeColor andForthString:(UIColor *)ForthColor andFifthString:(UIColor *)FifthColor;







#pragma mark - 单纯改变一句话中的某些字的颜色（一种颜色）
/**
 *  单纯改变一句话中的某些字的颜色（一种颜色）
 *
 *  @param color    需要改变成的颜色
 *  @param str 总的字符串
 *  @param subStringArr 需要改变颜色的文字数组(字符串中所有的 相同的字)
 *
 *  @return 生成的富文本
 */
+(NSMutableAttributedString *)changeTextColorWithColor:(UIColor *)color string:(NSString *)str andSubString:(NSArray *)subStringArr;


#pragma mark - 获取某个子字符串在某个总字符串中位置数组
/**
 *  获取某个字符串中子字符串的位置数组 (字符串中所有的 相同的字)
 *
 *  @param totalString 总的字符串
 *  @param subString   子字符串
 *
 *  @return 位置数组
 */
+ (NSMutableArray *)getRangeWithTotalString:(NSString *)totalString SubString:(NSString *)subString;



#pragma mark - 改变某些文字的颜色 并单独设置其字体

/**
 *  改变某些文字的颜色 并单独设置其字体
 *
 *  @param font        设置的字体
 *  @param color       颜色
 *  @param totalString 总的字符串
 *  @param subArray    想要变色的字符数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)changeFontAndColor:(UIFont *)font Color:(UIColor *)color TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray;



#pragma mark - 改变富文本中某个字符串字体的大小
+ (NSMutableAttributedString *)changeFont:(UIFont *)font Color:(UIColor *)color WithAttributedString:(NSMutableAttributedString *)attributString WithOriginString:(NSString *)originString SubString:(NSString *)subString;

#pragma mark - 为某些文字下面画线   (中画线 / 下画线)
/**
 *  为某些文字下面画线
 *
 *  @param totalString 总的字符串
 *  @param subArray    需要画线的文字数组
 *  @param lineColor   线条的颜色
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)addLinkWithTotalString:(NSString *)totalString andLineColor:(UIColor *)lineColor SubStringArray:(NSArray *)subArray;

@end

NS_ASSUME_NONNULL_END
