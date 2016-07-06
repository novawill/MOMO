//
//  UnsignedMeViewController.m
//  MOMO
//
//  Created by 黄梓伦 on 6/17/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "UnsignedMeViewController.h"
#import "UnloginSettingViewController.h"
@interface UnsignedMeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIImageView *settingBtn;
- (IBAction)loginAction:(UIButton *)sender;

@end

@implementation UnsignedMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loginBtn.layer.cornerRadius = 50;
    _loginBtn.layer.masksToBounds = YES;
    
    _settingBtn.userInteractionEnabled = YES;
    
    [_settingBtn addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showSettingMenu)]];
    
}
- (void)showSettingMenu
{
    
    
    NSLog(@"showSettingMenu");
    
    _settingBtn.alpha = 0.5;
    _settingBtn.layer.shouldRasterize = YES;
    
    _settingBtn.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
   
    UIStoryboard *settingStoryBoard = [UIStoryboard storyboardWithName:@"UnloginSettingViewController" bundle:nil];
    
    UnloginSettingViewController *unloginVC = [settingStoryBoard instantiateViewControllerWithIdentifier:@"UnloginSettingViewController"];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:unloginVC animated:YES completion:nil];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)loginAction:(UIButton *)sender {
    
    NSLog(@"loginAction");
    
}
@end
