//
//  NSData+BgData.h
//  ArrQManagerOne
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019年 ArrQ. All rights reserved.
//
/*
 NSData *data = [[NSData alloc]initWithBase64EncodedString:responseObject options:NSDataBase64DecodingIgnoreUnknownCharacters];
 NSData *tempData = [data gunzippedData];
 NSString *newstr = [[NSString alloc] initWithData:tempData encoding:NSUTF8StringEncoding];
 
 
 
 */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (BgData)

// **************************** data_zip ****************************

- (nullable NSData *)getZipData_g_un;
- (nullable NSData *)getZipDataWithCompressionLevel_g:(float)level;
- (nullable NSData *)getZipData_g;
- (BOOL)getIsZipData_g;
// **************************** data_zip ****************************

// **************************** data_save ****************************
/**保存二进制数据到本地*/
+ (void)getSaveDataToSandbox:(NSData *)data withName:(NSString *)name;
/**读取二进制数据*/
+ (NSData *)getReadDataFromSandboxWithName:(NSString *)name;
/**删除本地二进制数据*/
+ (BOOL)getDeleteDataAtSandbox;
// **************************** data_save ****************************

@end

NS_ASSUME_NONNULL_END
