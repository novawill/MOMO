//
//  SettingTableViewController.m
//  MOMO
//
//  Created by 黄梓伦 on 6/17/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "SettingTableViewController.h"

@interface SettingTableViewController ()
- (IBAction)dailyNotifAction:(UISwitch *)sender;

- (IBAction)nopicSwitch:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UITableViewCell *cleanCacheAction;
@property (weak, nonatomic) IBOutlet UITableViewCell *animationAction;
@property (weak, nonatomic) IBOutlet UITableViewCell *reviewAction;


@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.cleanCacheAction addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cleanCache)]];
   
    [self.animationAction addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(animation)]];
    
    [self.reviewAction addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(review)]];
    
}
- (void)review
{
    
    NSLog(@"review");
    
    
}
- (void)animation
{
    
    NSLog(@"animation");
    
    
}
- (void)cleanCache
{
    
    NSLog(@"cleanCache");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}





- (IBAction)dailyNotifAction:(UISwitch *)sender {
    
    NSLog(@"dailyNotif");
}

- (IBAction)nopicSwitch:(UISwitch *)sender {
    
    NSLog(@"noPic");
}
@end
