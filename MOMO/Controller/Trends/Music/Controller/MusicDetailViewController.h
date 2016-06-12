//
//  MusicDetailViewController.h
//  MOMO
//
//  Created by 黄梓伦 on 6/11/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "BaseViewController.h"
#import "MusicModel.h"
@interface MusicDetailViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@property (nonatomic, strong) Meows *model;

@end
