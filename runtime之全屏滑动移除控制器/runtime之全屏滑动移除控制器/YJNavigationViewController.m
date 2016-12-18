//
//  YJNavigationViewController.m
//  runtime之全屏滑动移除控制器
//
//  Created by simplyou on 2016/12/18.
//  Copyright © 2016年 coderYJ. All rights reserved.
//

#import "YJNavigationViewController.h"
#import <objc/runtime.h>

@interface YJNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation YJNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // <UIScreenEdgePanGestureRecognizer: 0x7f860f70d460; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7f860f401fa0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7f860f70cfe0>)>>
    
    
    
//    NSLog(@"-- %@",ges);
    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGes:)];
//    [self.view addGestureRecognizer:pan];
    
//   id target = [ges valueForKeyPath:@""];
    
    /**
     获取某一个类下面的所有成员属性
     cls 获取的那个类
     outCount这个类下面的成员属性的个数
     返回这个类下面的成员属性数组
     */
//    unsigned int outCount = 0;
//    
//    // 说明 Ivar是C语言的成员变量,这个方法是拷贝一份这个类下面的成员变量
//    Ivar *ivars = class_copyIvarList([UIGestureRecognizer class], &outCount);
//    
//    for (int i = 0; i< outCount; i++) {
//        //ivar_getName 获取某一个成员变量下面的名称,因为这个方法返回的类型是const char *所以需要把char转换为NSString,直接包装成对象就可以了
//       NSString *name = @(ivar_getName(ivars[i]));
//        
//        NSLog(@"%@",name);
//    }
    UIGestureRecognizer *ges = self.interactivePopGestureRecognizer;
    // 打印,输出了很多成员属性,其中最重要的成员属性是_targets,据此我们猜测,target可能存在于_targets里面,然后我们尝试一下
    NSArray *targetArray = [ges valueForKeyPath:@"_targets"];
    // 去掉数组
    id tempTarget = targetArray[0];
    // 获取target
    id target = [tempTarget valueForKeyPath:@"_target"];
    
    // 消除方法弃用(过时)的警告
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    // 添加全屏滑动手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
#pragma clang diagnostic pop
    [self.view addGestureRecognizer:pan];
    
    pan.delegate = self;
}
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.viewControllers.count > 1) {
        // 非根控制器
        return YES;
    }else{
        // 跟控制器
        return NO;
    }
}
@end
