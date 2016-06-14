//
//  AlbumDetailViewController.h
//  MOMO
//
//  Created by 黄梓伦 on 6/13/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "BaseViewController.h"
#import "AlbumModel.h"
@interface AlbumDetailViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *authorDescLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *littleTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *image;
- (IBAction)backAction:(id)sender;
@property (nonatomic, strong) Meows *model;
@end
