//
//  CLStatusBarHUD.m
//  CLStatusBarHUD
//
//  Created by Cyrilshanway on 2016/6/27.
//  Copyright © 2016年 Cyrilshanway. All rights reserved.
//

#import "CLStatusBarHUD.h"


#define CLMessageFont [UIFont systemFontOfSize:12]

/** 消息的停留時間 */
static CGFloat const CLMessageDuration = 2.0;
/** 消息顯示\隱藏的動畫時間 */
static CGFloat const CLAnimationDuration = 0.25;

@implementation CLStatusBarHUD

/** 全局的窗口 */
static UIWindow *window_;
/** 定時器 */
static NSTimer *timer_;

/**
 * 顯示窗口
 */
+ (void)showWindow
{
    // frame數據
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, 20);
    
    // 顯示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    window_.hidden = NO;
    
    // 動畫
    frame.origin.y = 0;
    [UIView animateWithDuration:CLAnimationDuration animations:^{
        window_.frame = frame;
    }];
}


/**
 * 顯示普通訊息
 * @param msg       文字
 * @param image     圖片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    [timer_ invalidate];
    
    
    // 顯示窗口
    [self showWindow];
    
    // 添加按鈕
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = CLMessageFont;
    if (image) { // 如果有图片
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定時
    timer_ = [NSTimer scheduledTimerWithTimeInterval:CLMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 * 顯示普通訊息
 */
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];

}

/**
 * 顯示成功訊息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"CLStatusBarHUD.bundle/success"]];
    
}
/**
 * 顯示失敗訊息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"CLStatusBarHUD.bundle/error"]];
}
/**
 * 顯示正在處理的訊息
 */
+ (void)showLoading:(NSString *)msg
{
    // 停止定時器
    [timer_ invalidate];
    timer_ = nil;
    
    // 顯示窗口
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = CLMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 文字寬度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : CLMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
    
    
}
/**
 * 隱藏
 */
+ (void)hide
{
    [UIView animateWithDuration:CLAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -frame.origin.y;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

+ (void)showXXX
{
    
}

@end
