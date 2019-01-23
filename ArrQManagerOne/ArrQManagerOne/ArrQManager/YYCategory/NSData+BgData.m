//
//  NSData+BgData.m
//  ArrQManagerOne
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019年 ArrQ. All rights reserved.
//

#import "NSData+BgData.h"
#import <zlib.h>

@implementation NSData (BgData)

// **************************** data_zip ****************************

- (NSData *)getZipData_g_un{
    if (self.length == 0 || ![self getIsZipData_g])
    {
        return self;
    }
    
    z_stream stream;
    stream.zalloc = Z_NULL;
    stream.zfree = Z_NULL;
    stream.avail_in = (uint)self.length;
    stream.next_in = (Bytef *)self.bytes;
    stream.total_out = 0;
    stream.avail_out = 0;
    
    NSMutableData *output = nil;
    if (inflateInit2(&stream, 47) == Z_OK)
    {
        int status = Z_OK;
        output = [NSMutableData dataWithCapacity:self.length * 2];
        while (status == Z_OK)
        {
            if (stream.total_out >= output.length)
            {
                output.length += self.length / 2;
            }
            stream.next_out = (uint8_t *)output.mutableBytes + stream.total_out;
            stream.avail_out = (uInt)(output.length - stream.total_out);
            status = inflate (&stream, Z_SYNC_FLUSH);
        }
        if (inflateEnd(&stream) == Z_OK)
        {
            if (status == Z_STREAM_END)
            {
                output.length = stream.total_out;
            }
        }
    }
    
    return output;
}



- (NSData *)getZipDataWithCompressionLevel_g:(float)level{
    if (self.length == 0 || [self getIsZipData_g])
    {
        return self;
    }
    
    z_stream stream;
    stream.zalloc = Z_NULL;
    stream.zfree = Z_NULL;
    stream.opaque = Z_NULL;
    stream.avail_in = (uint)self.length;
    stream.next_in = (Bytef *)(void *)self.bytes;
    stream.total_out = 0;
    stream.avail_out = 0;
    
    static const NSUInteger ChunkSize = 16384;
    
    NSMutableData *output = nil;
    int compression = (level < 0.0f)? Z_DEFAULT_COMPRESSION: (int)(roundf(level * 9));
    if (deflateInit2(&stream, compression, Z_DEFLATED, 31, 8, Z_DEFAULT_STRATEGY) == Z_OK)
    {
        output = [NSMutableData dataWithLength:ChunkSize];
        while (stream.avail_out == 0)
        {
            if (stream.total_out >= output.length)
            {
                output.length += ChunkSize;
            }
            stream.next_out = (uint8_t *)output.mutableBytes + stream.total_out;
            stream.avail_out = (uInt)(output.length - stream.total_out);
            deflate(&stream, Z_FINISH);
        }
        deflateEnd(&stream);
        output.length = stream.total_out;
    }
    
    return output;
}

- (NSData *)getZipData_g{
    return [self getZipDataWithCompressionLevel_g:-1.0f];
}



- (BOOL)getIsZipData_g{
    const UInt8 *bytes = (const UInt8 *)self.bytes;
    return (self.length >= 2 && bytes[0] == 0x1f && bytes[1] == 0x8b);
}

// **************************** data_zip ****************************


// **************************** data_save ****************************

//创建文件夹
- (void)getCreateFile{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *pathDocument = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/Sandbox",pathDocument];
    //判断文件夹是否存在，如果不存在就创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }else{
        NSLog(@"文件夹已经存在");
    }
}
#pragma mark - 保存二进制数据到沙盒指定文件夹
+ (void)getSaveDataToSandbox:(NSData *)data withName:(NSString *)name{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *pathDocument = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/Sandbox",pathDocument];
    //判断文件夹是否存在，如果不存在就创建
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }else{
        NSLog(@"文件夹已经存在");
    }
    NSString *datafilePath = [filePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt",name]];
    BOOL isWriteSuccess = [data writeToFile:datafilePath atomically:YES];
    if (isWriteSuccess) {
        NSLog(@"写入成功");
    } else {
        
        NSLog(@"写入失败");
    }
}
#pragma mark - 从沙盒指定文件夹读取二进制数据
+ (NSData *)getReadDataFromSandboxWithName:(NSString *)name{
    
    NSString *pathDocument = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/Sandbox",pathDocument];
    NSError *error = nil;
    NSData * data = [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.txt",filePath,name] options:NSUTF8StringEncoding error:&error];
    if (error != nil){
        NSLog(@"读取数据错误信息%@", [error localizedDescription]);//将错误信息输出来
        return nil;
    }else{
        return data;
    }
    
}
#pragma mark - 删除沙盒指定文件加数据
+ (BOOL)getDeleteDataAtSandbox{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *pathDocument = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/Sandbox",pathDocument];
    BOOL deleteStatus = [fileManager removeItemAtPath:filePath error:nil];
    return deleteStatus;
    
    
}

// **************************** data_save ****************************


@end
