//
//  BgBaseViewController.m
//  YYTools
//
//  Created by admin on 2019/1/19.
//  Copyright © 2019年 ArrQ. All rights reserved.
//

#import "BgBaseViewController.h"

@interface BgBaseViewController ()

@end

@implementation BgBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    
    [self customTableview];
    
    [self customNavi];
    
    if (self == self.navigationController.viewControllers[0]) {
        
        self.navigationItem.leftBarButtonItem = nil;
        
    }
    
    
    
}

# pragma mark ---  适应 高度 ---
- (void)customTableview{
    
    if (@available(iOS 11.0, *)) {
        
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
        
        
    } else {
        
        self.automaticallyAdjustsScrollViewInsets = NO;
        
    }
    
    
    
}


# pragma mark --- 加返回按钮 ---
- (void)customNavi{
    
    
    
    CGFloat btnWidth = 30,btnHeight = 44,imgMagin = 10;
    
    
    UIView *view_left = [[UIView alloc] initWithFrame:CGRectMake(0, 0, btnWidth, btnHeight)];
    
    UIButton *button_left = [UIButton buttonWithType:UIButtonTypeCustom];
    button_left.frame = CGRectMake(0, 0, btnWidth, btnHeight);
    button_left.imageEdgeInsets = UIEdgeInsetsMake(0, -imgMagin, 0, 0);
    [button_left addTarget:self action:@selector(leftBtn:) forControlEvents:UIControlEventTouchUpInside];
    [button_left setImage:[UIImage imageNamed:@"left_back_btn"] forState:0];
    [view_left addSubview:button_left];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:view_left];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

- (void)leftBtn:(UIButton *)sender{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}



@end


