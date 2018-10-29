//
//  UIViewController+Loading.h
//  FF_LoaingView
//
//  Created by mac on 2018/10/26.
//  Copyright © 2018 healifeGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

//NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Loading)

///加载菊花
-(void)showLoading;
-(void)hiddenLoading;

///提示弹窗 - 2.0秒后自动消失

///通用提示弹窗
- (void)showAlert:(NSString *)text imageName:(NSString *)imageName completeBlock:(dispatch_block_t)completeBlock;

///成功 - 提示弹窗
-(void)showSuccessAlert:(NSString *)text completeBlock:(void (^) (void))completeBlock;

///失败 - 提示弹窗
-(void)showFailAlert:(NSString *)text completeBlock:(void (^) (void))completeBlock;

///提醒 - 提示弹窗
-(void)showWarmingAlert:(NSString *)text completeBlock:(dispatch_block_t)completeBlock;


@end

//NS_ASSUME_NONNULL_END
