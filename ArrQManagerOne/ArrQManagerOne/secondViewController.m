//
//  secondViewController.m
//  ArrQManagerOne
//
//  Created by admin on 2019/1/23.
//  Copyright © 2019年 ArrQ. All rights reserved.
//

#import "secondViewController.h"
#import "ArrQManagerHeader.h"
#import "thirdViewController.h"

@interface secondViewController (){
    
    dispatch_source_t _timeOne;
    dispatch_source_t _timeTwo;
    NSInteger _timeOneNum;
    NSInteger _timeTwoNum;

}

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button_left = [UIButton buttonWithType:UIButtonTypeCustom];
    button_left.frame = CGRectMake(100, 100, 60, 44);
    [button_left setTitle:@"返回" forState:UIControlStateNormal];
    button_left.titleLabel.font = [UIFont systemFontOfSize:14];
    button_left.layer.masksToBounds = YES;
    button_left.layer.cornerRadius = 5;
 
    [button_left setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    button_left.adjustsImageWhenHighlighted = NO;
    
    [button_left addTarget:self action:@selector(getClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    button_left.tag = 0;

    [self.view addSubview:button_left];

    
    
    UIButton *button_right = [UIButton buttonWithType:UIButtonTypeCustom];
    button_right.frame = CGRectMake(200, 100, 60, 44);

    [button_right setTitle:@"前进" forState:UIControlStateNormal];
    button_right.titleLabel.font = [UIFont systemFontOfSize:14];
    button_right.layer.masksToBounds = YES;
    button_right.layer.cornerRadius = 5;
    
    [button_right setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    button_right.adjustsImageWhenHighlighted = NO;
    
    [button_right addTarget:self action:@selector(getClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    button_right.tag = 1;
    [self.view addSubview:button_right];
    
    
   
    
    
    

}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
   
  
    
    _timeTwoNum = 10;
    _timeOneNum = 10;

    [self getDao];
    
    [self getDaotwo];

    
}

- (void)getDao{
    

    [[YYTimeManager shareManager] getDaoJiShiWithTime:_timeOneNum andTimerOne:_timeOne andFinishBlock:^(NSInteger times) {
        
        if(times == 0){
            
            [self getDao];
            
        }
        
    }];
    
    
}


- (void)getDaotwo{
    

    [[YYTimeManager shareManager] getDaoJiShiWithTime:_timeTwoNum andTimerOne:_timeTwo andFinishBlock:^(NSInteger times) {
        
        if(times == 0){
            
            [self getDaotwo];
            
        }
        
    }];
    
    
}




- (void)getClickBtn:(UIButton *)sender{
    
    if (sender.tag == 0) {
        
        [self dismissViewControllerAnimated:YES completion:nil];

        
    }else{
        
        thirdViewController *pushVC = [[thirdViewController alloc] init];
        
        
        [self presentViewController:pushVC animated:YES completion:nil];
        
        
        
    }
    
    
    
}



- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];

    _timeOneNum = 0;
    _timeTwoNum = 0;

    
}






@end
