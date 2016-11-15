//
//  ZDTabBarViewController.m
//  ZDTabBar
//
//  Created by 赵东亮 on 16/11/15.
//  Copyright © 2016年 赵东亮. All rights reserved.
//

#import "ZDTabBarViewController.h"
#import "ZDBlueViewController.h"
#import "ZDYelllowViewController.h"
#import "ZDGreenViewController.h"
#import "ZDWhiteViewController.h"
#import "ZDRedViewController.h"
#import "ZDBottomView.h"


@interface ZDTabBarViewController ()

@end

@implementation ZDTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // 设置子控制器
    [self setupChildVCs];
    
    // 自定义tabBar
    [self setupBottomView];
}

#pragma mark - 设置子控制器
- (void)setupChildVCs {

    // 蓝色控制器
    UINavigationController *blueNav = [[UINavigationController alloc] initWithRootViewController:[[ZDBlueViewController alloc] init]];
    // 白色控制器
    UINavigationController *whiteNav = [[UINavigationController alloc] initWithRootViewController:[[ZDWhiteViewController alloc] init]];
    // 红色控制器
    UINavigationController *redNav = [[UINavigationController alloc] initWithRootViewController:[[ZDRedViewController alloc] init]];
    // 黄色控制器
    UINavigationController *yellowNav = [[UINavigationController alloc] initWithRootViewController:[[ZDYelllowViewController alloc] init]];
    // 绿色控制器
    UINavigationController *greenNav = [[UINavigationController alloc] initWithRootViewController:[[ZDGreenViewController alloc] init]];
    
    // 添加为子控制器
    self.viewControllers = @[blueNav, whiteNav, redNav, yellowNav, greenNav];
}


#pragma mark - 自定义tabBar
- (void)setupBottomView {

    // 创建自定义底部tabBar，并添加到self.tabBar
    ZDBottomView *bottomView = [[ZDBottomView alloc] init];
    bottomView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
    bottomView.frame = self.tabBar.bounds;
    [self.tabBar addSubview:bottomView];
    
    // 遍历子控制器，添加按钮
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *norImageName = [NSString stringWithFormat:@"TabBar%@", @(idx + 1)];
        NSString *selImageName = [NSString stringWithFormat:@"TabBar%@Sel", @(idx + 1)];
        
        UIImage *norImage = [UIImage imageNamed:norImageName];
        UIImage *selImage = [UIImage imageNamed:selImageName];

        [bottomView addBottomBtnWithNorImage:norImage selImage:selImage];
        
    }];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
