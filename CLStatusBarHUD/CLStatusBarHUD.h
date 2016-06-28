//
//  CLStatusBarHUD.h
//  CLStatusBarHUD
//
//  Created by Cyrilshanway on 2016/6/27.
//  Copyright © 2016年 Cyrilshanway. All rights reserved.
//  大版本號.功能更新版本號.BUG修復版本號
//  0.0.0


#import <UIKit/UIKit.h>


@interface CLStatusBarHUD : NSObject

/**
 * 顯示普通訊息
 * @param msg       文字
 * @param image     圖片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;
/**
 * 顯示普通訊息
 */
+ (void)showMessage:(NSString *)msg;
/**
 * 顯示成功訊息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 * 顯示失敗訊息
 */
+ (void)showError:(NSString *)msg;
/**
 * 顯示正在處理的訊息
 */
+ (void)showLoading:(NSString *)msg;
/**
 * 隱藏
 */
+ (void)hide;

+ (void)showXXX;
@end
