//
//  ViewController.m
//  ArrQManagerOne
//
//  Created by admin on 2019/1/22.
//  Copyright © 2019年 ArrQ. All rights reserved.
//

#import "ViewController.h"
#import "ArrQManagerHeader.h"


#import "secondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *arr = [NSArray getAllFanWithArray:@[@"2",@"4",@"1",@"3",@"5"]];

    NSLog(@"===%@",arr);
    
    
    NSString *str_000 = [NSArray getAllMaxWithArray:arr];
    NSString *str_001 = [NSArray getAllMinWithArray:arr];
    NSString *str_002 = [NSArray getAllSumWithArray:arr];

    NSLog(@"===%@",str_000);
    NSLog(@"===%@",str_001);
    NSLog(@"===%@",str_002);

    
    NSArray *arr_Up = [NSArray getAllUpNumArrayWithArray:@[@"2",@"4",@"1",@"3",@"5"]];
    
    NSLog(@"===%@",arr_Up);

    NSArray *arr_down = [NSArray getAllDownNumArrayWithArray:@[@"2",@"4",@"1",@"3",@"5"]];
    
    NSLog(@"===%@",arr_down);
    
    
    self.view.backgroundColor = [UIColor redColor];


    
    
    

}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    [self getDao];
    
    
    
    
}


- (void)getDao{
    
    
    [[YYTimeManager shareManager] getDaoJiShiWithTime:10 andFinishBlock:^(NSInteger times) {
        
        
        if(times == 0){
            
            [self getDao];

        }
        
        
    }];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    secondViewController *pushVC = [[secondViewController alloc] init];

    
    [self presentViewController:pushVC animated:YES completion:nil];
    
    
    
    
}





@end
