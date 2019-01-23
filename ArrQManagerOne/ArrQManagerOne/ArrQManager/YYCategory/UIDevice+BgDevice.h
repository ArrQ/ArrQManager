//
//  UIDevice+BgDevice.h
//  ArrQManagerOne
//
//  Created by admin on 2019/1/23.
//  Copyright © 2019年 ArrQ. All rights reserved.
//
/*
 模拟器上结果：
 
 System Name: iPhone OS
 
 System Version: 4.2
 
 Unique ID: 21FFE0FF-429B-5D0B-96D2-EADCA3203260
 
 Model: iPhone Simulator
 
 Name:  iPhone Simulator
 
 
 真机上结果：
 
 System Name: iPhone OS
 
 System Version: 4.2.1
 
 Unique ID: 9b5ded78d5fa0ac96250f8b4af0e46f40b96ea6d
 
 Model: iPhone
 
 Name: “ArrQ”的 iPhone
 
 
 */


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (BgDevice)
// Device 标识符
+ (NSString *)getDevice_UUID;

// Device ArrQ的 iPhone
+ (NSString *)getDevice_phoneName;

// Device 型号 iPad、iphone、ipod touch
+ (NSString *)getDevice_phoneModel;

// Device 本地版本 iPad
+ (NSString *)getDevice_localizedModel;

// Device 系统版本 9.2
+ (NSString *)getDevice_systemVersion;

// Device 系统名称 iPhone OS
+ (NSString *)getDevice_systemName;

// Device 电池状态 0
+ (UIDeviceBatteryState)getDevice_batteryState;

// Device 电池电量 -1.000000
+ (CGFloat)getDevice_batteryLevel;

@end

NS_ASSUME_NONNULL_END
