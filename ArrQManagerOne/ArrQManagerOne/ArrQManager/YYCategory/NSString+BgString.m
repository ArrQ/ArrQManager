//
//  NSString+BgString.m
//  YYTools
//
//  Created by admin on 2019/1/19.
//  Copyright © 2019年 ArrQ. All rights reserved.
//

#import "NSString+BgString.h"
#import <CommonCrypto/CommonDigest.h>
#import "sys/utsname.h"
@implementation NSString (BgString)

#pragma mark - 获取当前版本号

+ (NSString *)getCurrentAPPVersion{
    
    NSDictionary *dicOne = [[NSBundle mainBundle] infoDictionary];
    
    NSString *currentVersion = [dicOne objectForKey:@"CFBundleShortVersionString"];
    
    return currentVersion;
    
}


#pragma mark - 计算字符串空间
- (CGRect)getRectWithStringBoundingSize:(CGSize )stringSize withStringFont:(UIFont *)font{
    CGRect rect = [self boundingRectWithSize:stringSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    return rect;
}

#pragma mark - MD5加密
-(NSString *)getMd5{
    const char* input = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}



#pragma mark - 把字典转换成JSON格式字符串
+ (NSString *)getJsonStrWithDic:(NSDictionary *)dic{
    NSData *dicData =[NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *dicDataJsonString =[[NSString alloc]initWithData:dicData encoding:NSUTF8StringEncoding];
    return dicDataJsonString;
}

#pragma mark - 把json字符串转化为json格式数据
+ (NSDictionary *)getJsonDicWithJsonStr:(NSString *)jsonStr{
    
    NSDictionary *retDict = nil;
    if ([jsonStr isKindOfClass:[NSString class]]) {
        NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
        retDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        return  retDict;
    }else{
        return retDict;
    }
    
}

/**正则匹配手机号码*/
- (BOOL)getCheckTelNumber{
    NSString *pattern = @"^((13[0-9])|(15[^4,\\D])|(17[0-9])|(18[0,0-9]))\\d{8}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

/**检查 密码是否是 6-20 数字密码*/
- (BOOL)getCheckPassWord{
    NSString *pattern = @"^[0-9A-Za-z]{6,20}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

/**正则匹配用户身份证号 15 或 18 位*/
- (BOOL)getCheckUserIdCard{
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
#pragma mark - 正则匹配URL
- (BOOL)getIsUrlString{
    
    NSString *pattern = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
#pragma mark - 正则匹配用户名是否可用(数字字母下划线横杠汉字)
- (BOOL)getCheckAccount{
    NSString *pattern = @"^[a-zA-Z0-9_\\-\u4e00-\u9fa5]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
#pragma mark - 正则匹配纯数字
- (BOOL)getCheckAllNumber{
    NSString *pattern = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}
//  判断字符串是否为空
+(BOOL)getIsNull:(id)string{

    if (string == nil) {
        return YES;
    }
    if (string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

#pragma mark - 字符串是否包含中文
- (BOOL)getIsContainsChinese{
    for (NSInteger i = 0; i < self.length; i++) {
        unichar ch = [self characterAtIndex:i];
        if (0x4E00 <= ch && ch <= 0x9FA5) {
            return YES;
        }
    }
    return NO;
    
}
#pragma mark - 将字符串转化为拼音
- (NSString *)getPinyin{
    NSMutableString *str = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}
#pragma mark - 返回字符串拼音首字母
- (NSString *)getPinyinInitial{
    NSMutableString *str = [self mutableCopy];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics, NO);
    
    NSArray *word = [str componentsSeparatedByString:@" "];
    NSMutableString *initial = [[NSMutableString alloc] initWithCapacity:str.length / 3];
    for (NSString *str in word) {
        [initial appendString:[str substringToIndex:1]];
    }
    return initial;
}


# pragma mark - url 中文格式化
+ (NSString *)getUrlStrWithUrlStr:(NSString *)UrlStr{
    
    NSString *newUrlStr;
    /*! ios9适配的话 打开第一个 */
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 9.0)
    {
        
        
        NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
        
        NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
        
        newUrlStr = [UrlStr stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
        
        
    }else{
        newUrlStr = [UrlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    
    
    
    return newUrlStr;
    
    
}
# pragma mark - url 中文格式化
+ (NSString *)getUrlStr_UTF8:(NSString *)UrlStr{
    /*! ios9适配的话 打开第一个 */
    if ([[UIDevice currentDevice] systemVersion].floatValue >= 9.0)
    {
        return [UrlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    }else{
        return [UrlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
}

# pragma mark - html 文字转化富文本 格式

- (NSAttributedString *)getAttributedStrWithHtmlStr:(NSString *)htmlString{
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    return attributedString;
}


//存储Json
+ (void)getSaveJsonData:(NSDictionary *)responseBody AndFileName:(NSString *)name{
    NSLog(@"得到的数据 📚 %@",responseBody);
    if (responseBody == nil) {
        return;
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject:responseBody options:NSJSONWritingPrettyPrinted error:nil];
    //    将Json存进本地文件夹
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * path = [paths objectAtIndex:0];
    NSString * Json_path = [path stringByAppendingPathComponent:name];
    //==写入文件
    NSLog(@"%@",[data writeToFile:Json_path atomically:YES] ? @"Succeed":@"Failed");
    
}
+ (NSDictionary *)getDataAndFileName:(NSString *)name{
    //    读取Json
    //==Json文件路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *Json_path = [path stringByAppendingPathComponent:name];
    //==Json数据
    NSData *data = [NSData dataWithContentsOfFile:Json_path];
    //==JsonObject、
    if (data == nil)
    {
        return nil;
    }else
    {
        NSDictionary *JsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:NSJSONReadingAllowFragments
                                                                    error:nil];
        
        return JsonObject;
    }
    
    
}



@end
