//
//  LoadingView.h
//  FF_LoaingView
//
//  Created by mac on 2018/10/26.
//  Copyright © 2018 healifeGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

//NS_ASSUME_NONNULL_BEGIN

@interface LoadingView : UIView

@property (nonatomic,copy) NSString *text;

@property (nonatomic,strong) UIFont *font;

@property (nonatomic,strong) UIColor *textColor;


@property (nonatomic,strong) UIView *loadingView;


+ (LoadingView *)shareInstance;

- (void)startAnimating;

- (void)stopAnimating;

-(void)maskBgShow:(BOOL)isShow;

- (void)showAlert:(NSString *)text imageName:(NSString *)imageName;

@end

//NS_ASSUME_NONNULL_END
