//
//  AlbumDetailViewController.m
//  MOMO
//
//  Created by 黄梓伦 on 6/13/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "AlbumDetailViewController.h"

@interface AlbumDetailViewController ()

@end

@implementation AlbumDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self prefersStatusBarHidden];
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:_model.group.logo_url] placeholderImage:[UIImage imageNamed:@"WilliamHuang"]];
    
    self.groupNameLabel.text = _model.group.name;
    self.titleLabel.text = _model.title;
    
    self.littleTitleLabel.text = _model.desc;
    
    [self.image sd_setImageWithURL:[NSURL URLWithString:_model.images[0].raw] placeholderImage:[UIImage imageNamed:@"WilliamHuang"]];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_model.create_time];
    NSDateFormatter *_formatter=[[NSDateFormatter alloc]init];
    [_formatter setLocale:[NSLocale currentLocale]];
    [_formatter setDateFormat:@"yyyy.MM.dd hh:mm"];
    self.authorDescLabel.text = [NSString stringWithFormat:@"%@ %ld成员",[_formatter stringFromDate:date],_model.group.member_num];
    
    NSLog(@"%@",self.model);
    
    
}
//Hides StatusBar
- (BOOL)prefersStatusBarHidden{
    
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
