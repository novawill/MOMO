//
//  BaseViewController.h
//  MOMO
//
//  Created by 黄梓伦 on 5/27/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

//Show navigationItem which can perform RESideMenu methods
- (void)customNavigationItemWithLeftTile:(NSString *)leftTile RightTitle:(NSString *)rightTitle isShowRight:(BOOL)show;

//NavigationItem which can perform custom methods
- (void)customNavigationItemMethodsTitle:(NSString *)title target:(id)target selector:(SEL)action isLeft:(BOOL)isleft;

//NavigationItem which can perform custom methods with Image
- (void)customNavigationItemMethodsImage:(NSString *)image target:(id)target selector:(SEL)action isLeft:(BOOL)isleft;

//NavigationItem which can perform RESideMenu methods with Image
- (void)customNavigationItemWithLeftImage:(NSString *)leftImage RightImage:(NSString *)rightImage isShowRight:(BOOL)show;

//Custom NavigationItem
- (void)customNavigationItem;

//addNavigationTitle
- (void)addNavigationTitle:(NSString *)title andColor:(UIColor *)color;
@end
