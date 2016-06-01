//
//  XLSphereView.h
//  XLSphereView
//
//  Created by 袁小龙 on 16/4/4.
//  Copyright © 2016年 xiaolong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLSphereView : UIView

@property(nonatomic,assign) BOOL isTimerStart;
/**
 *  设置球体上的显示项目
 */
- (void)setItems:(NSArray *)items;
/** 球体开始旋转*/
- (void)timerStart;
/** 球体停止旋转*/
- (void)timerStop;


@end
