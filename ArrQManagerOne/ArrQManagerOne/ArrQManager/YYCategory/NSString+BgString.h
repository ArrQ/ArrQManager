//
//  NSString+BgString.h
//  YYTools
//
//  Created by admin on 2019/1/19.
//  Copyright © 2019年 ArrQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (BgString)


//获取当前版本号
+ (NSString *)getCurrentAPPVersion;


/**
 *正则匹配手机号码
 */
- (BOOL)getCheckTelNumber;

/**
 *  检查 密码是否是 6-20 数字密码
 */
- (BOOL)getCheckPassWord;

/**
 *正则匹配用户身份证号 15 或 18 位
 */
- (BOOL)getCheckUserIdCard;

/**
 *正则匹配URL
 */
- (BOOL)getIsUrlString;
/**
 * 正则匹配用户名是否可用(数字字母下划线横杠汉字)
 */
- (BOOL)getCheckAccount;

/**
 * 正则匹配纯数字
 */
- (BOOL)getCheckAllNumber;

/**
 * 字符串非空判断
 */
+(BOOL)getIsNull:(id)string;


/**
 * 判断字符串中是否包含中文
 */
- (BOOL)getIsContainsChinese;

/**
 * 将字符串转化为拼音
 */
- (NSString *)getPinyin;

/**
 * 返回字符串拼音首字母
 */
- (NSString *)getPinyinInitial;

// http请求 中文符号转换为%格式 不常用
+ (NSString *)getUrlStrWithUrlStr:(NSString *)UrlStr;

// http请求 url 中文格式化
+ (NSString *)getUrlStr_UTF8:(NSString *)UrlStr;

// html格式 转化 富文本
- (NSAttributedString *)getAttributedStrWithHtmlStr:(NSString *)htmlString;

/**
 * 计算字符串空间大小
 */
- (CGRect)getRectWithStringBoundingSize:(CGSize )stringSize withStringFont:(UIFont *)font;

/**
 *MD5加密
 */
-(NSString *)getMd5;

/**
 *把字典转换成JSON格式字符串
 */
+ (NSString *)getJsonStrWithDic:(NSDictionary *)dic;

/**
 * 把json字符串转化为json格式数据
 */
+ (NSDictionary *)getJsonDicWithJsonStr:(NSString *)jsonStr;

// json 文件 保存与解析 可以 单独 写一个 类
+ (void)getSaveJsonData:(NSDictionary *)responseBody AndFileName:(NSString *)name;

+ (NSDictionary *)getDataAndFileName:(NSString *)name;


@end

NS_ASSUME_NONNULL_END
