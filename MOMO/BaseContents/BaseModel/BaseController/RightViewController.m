//
//  RightViewController.m
//  MOMO
//
//  Created by 黄梓伦 on 5/29/16.
//  Copyright © 2016 黄梓伦. All rights reserved.
//

#import "RightViewController.h"
#import "XLSphereView.h"
@interface RightViewController ()

@property (nonatomic, strong) XLSphereView *sphereView;

@end

@implementation RightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    CGFloat sphereViewW = self.view.frame.size.width - 120;
   
    CGFloat sphereViewH = sphereViewW;
    
    _sphereView = [[XLSphereView alloc] initWithFrame:CGRectMake(100, self.view.center.y, sphereViewW, sphereViewH)];
    _sphereView.center = CGPointMake(_sphereView.center.x, self.view.center.y);
  
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    
   // CGMutablePathRef circlePath = CGPathCreateMutable();
    
   
    
    for (NSInteger i = 0; i < 5; i ++) {
    
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
      
        
        switch (i) {
            case 0:
                
                [btn setTitle:[NSString stringWithFormat:@"推荐 Explore"] forState:UIControlStateNormal];

                break;
                
            case 1:

                [btn setTitle:[NSString stringWithFormat:@"关注 Following"] forState:UIControlStateNormal];

                break;
            case 2:
                
                [btn setTitle:[NSString stringWithFormat:@"视频 Video"] forState:UIControlStateNormal];

                break;
            case 3:
                
                [btn setTitle:[NSString stringWithFormat:@"音乐 Music"] forState:UIControlStateNormal];

                break;
            case 4:
                
                [btn setTitle:[NSString stringWithFormat:@"画册 Gallery"] forState:UIControlStateNormal];

                break;
        }
       
        btn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
      
        btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255. green:arc4random_uniform(255)/255. blue:arc4random_uniform(255)/255. alpha:1.];
     
        btn.frame = CGRectMake(0, 0, 150, 30);
        
        btn.layer.shadowOpacity = 1.0f;
        btn.layer.shadowOffset = CGSizeMake(-3, -3);

  
      //  CGPathAddEllipseInRect(circlePath, NULL,btn.bounds);
        
       // btn.layer.shadowPath = circlePath;
        
        //CGPathRelease(circlePath);
        
        
        
    
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
      
        [array addObject:btn];
       
        [_sphereView addSubview:btn];
    }
   
    [_sphereView setItems:array];
   
    [self.view addSubview:_sphereView];
    
}
- (void)buttonPressed:(UIButton *)btn
{
    
    [_sphereView timerStop];
    //
    [UIView animateWithDuration:0.3 animations:^{
      
        btn.transform = CGAffineTransformMakeScale(2., 2.);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
           
            btn.transform = CGAffineTransformMakeScale(1.,1.);
        } completion:^(BOOL finished) {
         
            [_sphereView timerStart];
        }];
    }];
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

@end
