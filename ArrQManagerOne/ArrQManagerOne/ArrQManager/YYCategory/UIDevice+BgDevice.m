//
//  UIDevice+BgDevice.m
//  ArrQManagerOne
//
//  Created by admin on 2019/1/23.
//  Copyright © 2019年 ArrQ. All rights reserved.
//

#import "UIDevice+BgDevice.h"

@implementation UIDevice (BgDevice)
+ (NSString *)getDevice_UUID {
    return [[UIDevice currentDevice] identifierForVendor].UUIDString;
}
+ (NSString *)getDevice_phoneName {
    return [UIDevice currentDevice].name;
}
+ (NSString *)getDevice_phoneModel {
    return [UIDevice currentDevice].model;
}
+ (NSString *)getDevice_localizedModel {
    return [UIDevice currentDevice].localizedModel;
}
+ (NSString *)getDevice_systemVersion {
    return [UIDevice currentDevice].systemVersion;
}
+ (NSString *)getDevice_systemName {
    return [UIDevice currentDevice].systemName;
}
+ (UIDeviceBatteryState)getDevice_batteryState {
    return [UIDevice currentDevice].batteryState;
}
+ (CGFloat)getDevice_batteryLevel {
    return [UIDevice currentDevice].batteryLevel;
}

@end
