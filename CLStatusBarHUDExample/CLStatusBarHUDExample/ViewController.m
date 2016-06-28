//
//  ViewController.m
//  CLStatusBarHUDExample
//
//  Created by Cyrilshanway on 2016/6/28.
//  Copyright © 2016年 Cyrilshanway. All rights reserved.
//

#import "ViewController.h"
#import "CLStatusBarHUD.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)message:(id)sender
{
    [CLStatusBarHUD showMessage:@"没有什麼事!!!!"];
}

- (IBAction)hide:(id)sender
{
    [CLStatusBarHUD hide];
}

- (IBAction)loading:(id)sender
{
    [CLStatusBarHUD showLoading:@"正在加載中..."];
}

- (IBAction)error:(id)sender
{
    [CLStatusBarHUD showError:@"加載失敗!"];
}

- (IBAction)success:(id)sender
{
    [CLStatusBarHUD showSuccess:@"加載成功!"];
    
}


@end
