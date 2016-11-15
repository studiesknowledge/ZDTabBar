//
//  ZDBottomView.h
//  ZDTabBar
//
//  Created by 赵东亮 on 16/11/15.
//  Copyright © 2016年 赵东亮. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZDBottomView;

@protocol ZDBottomViewDelegate <NSObject>

- (void)bottomView:(ZDBottomView *)bottomView index:(NSUInteger)idx;

@end

@interface ZDBottomView : UIView

@property (weak,nonatomic) id<ZDBottomViewDelegate> delegate;

- (void)addBottomBtnWithNorImage:(UIImage *)norImage selImage:(UIImage *)selImage;
@end
