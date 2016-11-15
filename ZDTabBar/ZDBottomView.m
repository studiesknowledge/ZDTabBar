//
//  ZDBottomView.m
//  ZDTabBar
//
//  Created by 赵东亮 on 16/11/15.
//  Copyright © 2016年 赵东亮. All rights reserved.
//

#import "ZDBottomView.h"
#import "ZDButton.h"


@interface ZDBottomView ()

@property (weak,nonatomic) ZDButton *selectedBtn;

@end


@implementation ZDBottomView


- (void)addBottomBtnWithNorImage:(UIImage *)norImage selImage:(UIImage *)selImage {

    // 创建按钮，设置属性
    ZDButton *btn = [ZDButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:norImage forState:UIControlStateNormal];
    [btn setBackgroundImage:selImage forState:UIControlStateSelected];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];

}

#pragma mark - 按钮的点击事件
- (void)btnClick:(ZDButton *)btn {

    // 清除之前的按钮的选中状态为NO
    self.selectedBtn.selected = NO;
    // 被点击按钮的选中状态为YES
    btn.selected = YES;
    // 赋值
    self.selectedBtn = btn;
    
    
    if ([self.delegate respondsToSelector:@selector(bottomView:index:)]) {
        
        [self.delegate bottomView:self index:btn.tag];
    }

}

#pragma mark - 对自定义按钮进行布局
-(void)layoutSubviews {

    [super layoutSubviews];

    // 按钮的宽，高，y
    CGRect frame = self.bounds;
    CGFloat btnW = frame.size.width / self.subviews.count;
    CGFloat btnH = frame.size.height;
    CGFloat btnY = 0;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat btnX = btnW * idx;
        obj.frame = CGRectMake(btnX, btnY, btnW, btnH);
        obj.tag = idx;
        
        // 设置默认的选中按钮
        if (idx == 0) {
            
            [self btnClick:obj];
        }
    }];
    
}

@end
