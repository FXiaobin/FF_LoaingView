//
//  ViewController.m
//  FF_LoaingView
//
//  Created by mac on 2018/10/26.
//  Copyright © 2018 healifeGroup. All rights reserved.
//

#import "ViewController.h"
#import "LoadingView.h"
#import "UIViewController+Loading.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 40)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"开始加载" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
   // [self showSuccessAlert:@"成功了 发生了的发生大是否发生了的发生大是否" completeBlock:nil];
    
   // [self showFailAlert:@"失败了" completeBlock:nil];
    
    
}

- (void)show:(UIButton *)sender{
//
//    [self showLoading];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self hiddenLoading];
//    });
    
    //[self showSuccessAlert:@"成功！" completeBlock:nil];
    
    [self showWarmingAlert:@"温馨提示温馨提示温馨提示温馨提示ee温馨提示温馨提示温馨" completeBlock:^{
        NSLog(@"-----------");
    }];
}


@end
