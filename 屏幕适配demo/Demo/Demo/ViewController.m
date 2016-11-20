//
//  ViewController.m
//  Demo
//
//  Created by simplyou on 2016/11/1.
//  Copyright © 2016年 coderYJ. All rights reserved.

//  微信公众号关注iOS精汇 简书coderYJ  微博coderYJ

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(LineX(20), LineY(20), LineX(100), LineY(30))];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"点我啊" forState:UIControlStateNormal];
    btn.titleLabel.font = Font(14);
    
}


@end
