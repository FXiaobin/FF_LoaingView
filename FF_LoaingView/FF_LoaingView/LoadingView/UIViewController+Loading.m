//
//  UIViewController+Loading.m
//  FF_LoaingView
//
//  Created by mac on 2018/10/26.
//  Copyright © 2018 healifeGroup. All rights reserved.
//

#import "UIViewController+Loading.h"
#import <Masonry.h>
#import "LoadingView.h"


@implementation UIViewController (Loading)

///显示loading
-(void)showLoading{
    
    LoadingView *load = [LoadingView shareInstance];
    load.frame = self.view.bounds;
    [load startAnimating];
    load.text = @"加载中...";
    [load maskBgShow:NO];
    [self.view addSubview:load];
    
    [load.loadingView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.and.height.mas_equalTo(120);
    }];
}

///移除loading
-(void)hiddenLoading{
    LoadingView *load = [LoadingView shareInstance];
    [load stopAnimating];
    
    [load removeFromSuperview];
}

-(void)showSuccessAlert:(NSString *)text completeBlock:(dispatch_block_t)completeBlock{
    [self showAlert:text imageName:@"MBProgress_success" completeBlock:completeBlock];
}

-(void)showFailAlert:(NSString *)text completeBlock:(dispatch_block_t)completeBlock{
    [self showAlert:text imageName:@"MBProgress_fail" completeBlock:completeBlock];
}

-(void)showWarmingAlert:(NSString *)text completeBlock:(dispatch_block_t)completeBlock{
    [self showAlert:text imageName:@"MBProgress_info" completeBlock:completeBlock];
}

///弹窗提示框2.0秒后并自动移除
- (void)showAlert:(NSString *)text imageName:(NSString *)imageName completeBlock:(dispatch_block_t)completeBlock{
    if (imageName.length == 0) {
        NSLog(@"--- 提示图片不能为空 ----");
        return;
    }
    LoadingView *load = [LoadingView shareInstance];
    load.frame = self.view.bounds;
    [load maskBgShow:NO];
    [self.view addSubview:load];
    
    ///计算文本可显示的最大宽度
    CGSize size = [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 140, 300) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16.0]} context:nil].size;

    CGFloat w = ceilf(size.width), h = ceilf(size.height);
    if (w > [UIScreen mainScreen].bounds.size.width - 140) {
        w = [UIScreen mainScreen].bounds.size.width - 100;
      
    }else if (w < 80.0) {
        w = 120.0;
    }else{
        w += 40;
    }
    
    if (h <= 20.0) {
        h = 120;
    }else{
        h = 110 + h;
    }
    
    [load.loadingView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(w);
        make.height.mas_equalTo(h);
    }];
    
    [load showAlert:text imageName:imageName];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [load removeFromSuperview];
        if (completeBlock) {
            completeBlock();
        }
    });
}

@end
