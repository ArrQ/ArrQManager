//
//  thirdViewController.m
//  ArrQManagerOne
//
//  Created by admin on 2019/1/23.
//  Copyright © 2019年 ArrQ. All rights reserved.
//

#import "thirdViewController.h"
#import "ArrQManagerHeader.h"

@interface thirdViewController (){
    
    dispatch_source_t _timeOne;

    
}

@end

@implementation thirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    [self getDao];
    
    
    
    
}

- (void)getDao{
    
    
//    [[YYTimeManager shareManager] getDaoJiShiWithTime:10 andFinishBlock:^(NSInteger times) {
//
//        if(times == 0){
//
//            [self getDao];
//
//        }
//    }];
    
    
    [[YYTimeManager shareManager] getDaoJiShiWithTime:10 andTimerOne:_timeOne andFinishBlock:^(NSInteger times) {
        
        if(times == 0){
            
            [self getDao];
            
        }
        
    }];
    
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}




@end
