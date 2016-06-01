//
//  MusicCell.m
//  MOMO
//
//  Created by 黄梓伦 on 5/29/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "MusicCell.h"
#import <AVFoundation/AVFoundation.h>

@interface MusicCell()

@property (nonatomic, strong)  AVPlayer *audioPlayer;

@end

@implementation MusicCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)playAction:(id)sender {
    
    
    
    
}
- (IBAction)sharAction:(id)sender {
}
- (IBAction)thumbAction:(id)sender {
}
- (IBAction)commentAction:(id)sender {
}


- (void)setModel:(Meows *)model
{
    
    _model = model;
    
    //Sets BackImage
    [self.backImage sd_setImageWithURL:[NSURL URLWithString:_model.thumb.raw] placeholderImage:[UIImage imageNamed:@"WilliamHuang.jpg"]];
    
    
    self.singerNameLabel.text = _model.artist;
    
    self.thumbNumberLabel.text = [NSString stringWithFormat:@"%ld",_model.bang_count];
    
    if (_model.category.name != nil) {
        
        self.typeLabel.text = [NSString stringWithFormat:@"#%@",_model.category.name];
    }else
    {
        //On account of several tests, some _model.category, which should had be "音乐" in accordance with json file, returned nil value or even had no property of category for uncertain reason, so I let typeLabel.text be "#其它" in that situation.
        self.typeLabel.text = @"#其它";
    }
    
    
    self.songDetailLabel.text = _model.title;
    
    self.songDescriptionText.text = _model.desc;
    
    self.groupName.text = _model.group.name;
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:_model.group.logo_url] placeholderImage:[UIImage imageNamed:@"AppIcon60x60"]];
    
    self.commentNumberLabel.text = [NSString stringWithFormat:@"%ld",_model.comment_count];
    
    //Converts seconds to mm:ss
    NSInteger musicDurationBySeconds = _model.music_duration;
    
    NSInteger minutes = musicDurationBySeconds / 60;
    NSInteger seconds = musicDurationBySeconds % 60;
    
    
    NSString *musicDurationStr = [[NSString alloc] initWithFormat:@"%ld:%@",minutes, seconds > 9 ? [NSString stringWithFormat:@"%ld",seconds]: [NSString stringWithFormat:@"0%ld",seconds]];
    
    self.musicDurationLabel.text = musicDurationStr;
    
    self.songNameLabel.text = _model.song_name;
    
}



@end
