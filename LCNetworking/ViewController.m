//
//  ViewController.m
//  LCNetworking
//
//  Created by lichao on 2017/3/3.
//  Copyright © 2017年 lichao. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "LCNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setUpBtn];
}

- (void)GetTest
{
    NSString *URL = @"http://sug.music.baidu.com/info/suggestion?";
    //请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"word"] = @"背包";
    params[@"version"] = @"2";
    params[@"from"] = @"0";
    
    [LCNetworking getWithURL:URL Params:params success:^(id responseObject) {
        NSLog(@"GET_success____%@", responseObject);
    } failure:^(NSString *error) {
        NSLog(@"GET_failure____%@", error);
    }];
}

- (void)PostTest
{
    NSString *URL = @"http://api.xinliji.me/com/loadBanner_v2";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"type"] = @"consultant";
    
    [LCNetworking PostWithURL:URL Params:params success:^(NSDictionary *responseObject) {
        NSLog(@"POST_success____%@", responseObject);
    } failure:^(NSString *error) {
        NSLog(@"POST_failure____%@", error);
    }];
}


- (void)setUpBtn
{
    __weak typeof(self) weakSelf = self;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = [UIColor redColor];
    //    btn1.frame = CGRectMake(100, 200, 150, 30);
    
    [btn1 setTitle:@"GET测试" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(GetTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.view.mas_top).offset(200);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(30);
        
    }];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.backgroundColor = [UIColor redColor];
    //    btn2.frame = CGRectMake(100, 300, 150, 30);
    [btn2 setTitle:@"POST测试" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(PostTest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(btn1.mas_centerX);
        make.centerY.mas_equalTo(btn1.mas_bottom).offset(100);
        make.size.mas_equalTo(btn1);
        
    }];
}

@end
