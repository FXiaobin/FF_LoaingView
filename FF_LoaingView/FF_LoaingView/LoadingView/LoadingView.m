//
//  LoadingView.m
//  FF_LoaingView
//
//  Created by mac on 2018/10/26.
//  Copyright © 2018 healifeGroup. All rights reserved.
//

#import "LoadingView.h"
#import <Masonry.h>

@interface LoadingView ()


@property (nonatomic,strong) UIActivityIndicatorView *indicatorView;

@property (nonatomic,strong) UILabel *titleLabel;


@property (nonatomic,strong) UIView *maskBg;


@property (nonatomic,strong) UIImageView *icon;


@end

@implementation LoadingView

+ (LoadingView *)shareInstance{
    static LoadingView *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LoadingView alloc] init];
    });

    return manager;
}

-(instancetype)init{
    if (self = [super init]) {
        
        self.loadingView = [[UIView alloc] init];
        
        self.loadingView.backgroundColor = [UIColor darkGrayColor];
        self.loadingView.clipsToBounds = YES;
        self.loadingView.layer.cornerRadius = 6.0f;
       
        [self addSubview:self.maskBg];
        [self addSubview:self.loadingView];
        [self.loadingView addSubview:self.indicatorView];
        [self.loadingView addSubview:self.icon];
        [self.loadingView addSubview:self.titleLabel];
        
        [self.maskBg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsZero);
        }];
        
        [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.width.and.height.mas_equalTo(120);
        }];
        
        [self.indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.loadingView);
            make.top.equalTo(self.loadingView).offset(25);
            make.width.and.height.mas_equalTo(40);
        }];
        
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.indicatorView);
            make.width.and.height.mas_equalTo(40);
        }];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.indicatorView.mas_bottom).offset(10);
            make.left.equalTo(self.loadingView).offset(20.0);
            make.right.equalTo(self.loadingView.mas_right).offset(-20.0);
            make.bottom.equalTo(self.loadingView.mas_bottom).offset(-25);
        }];
        
        
    }
    return self;
}

-(void)maskBgShow:(BOOL)isShow{
    self.maskBg.hidden = !isShow;
}

- (void)showAlert:(NSString *)text imageName:(NSString *)imageName{
    self.titleLabel.text = text;
    self.icon.hidden = NO;
    self.indicatorView.hidden = YES;
    self.icon.image = [UIImage imageNamed:imageName];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self removeFromSuperview];
//    });

}

- (void)startAnimating{
    self.icon.hidden = YES;
    self.indicatorView.hidden = NO;
    [self.indicatorView startAnimating];
}

-(void)stopAnimating{
    [self.indicatorView stopAnimating];
}

-(void)setText:(NSString *)text{
    _text = text;
    self.titleLabel.text = text;
}

-(void)setFont:(UIFont *)font{
    _font = font;
    self.titleLabel.font = font;
}

-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    self.textColor = textColor;
}

-(UIActivityIndicatorView *)indicatorView{
    if (_indicatorView == nil) {
        _indicatorView = [[UIActivityIndicatorView alloc] init];
        _indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    }
    return _indicatorView;
}

-(UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:16.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"加载中...";
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

-(UIImageView *)icon{
    if (_icon == nil) {
        _icon = [UIImageView new];
        _icon.hidden = YES;
    }
    return _icon;
}

-(UIView *)maskBg{
    if (_maskBg == nil) {
        _maskBg = [UIView new];
        _maskBg.backgroundColor = [UIColor blackColor];
        _maskBg.alpha = 0.5;
        _maskBg.hidden = YES;
    }
    return _maskBg;
}

@end
