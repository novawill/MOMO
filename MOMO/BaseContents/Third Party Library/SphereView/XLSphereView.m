//
//  XLSphereView.m
//  XLSphereView
//
//  Created by 袁小龙 on 16/4/4.
//  Copyright © 2016年 xiaolong. All rights reserved.
//

#import "XLSphereView.h"
#import "XLMatrix.h"

@interface XLSphereView()<UIGestureRecognizerDelegate>
{
    //标签数组，记录所有控件的标签
    NSMutableArray *tags;
    //坐标数组，记录所有控件的三维坐标
    NSMutableArray *coordinate;
    //三维坐标
    XLPoint normalDirection;
    //最后位置
    CGPoint last;
    //速度
    CGFloat velocity;
    //定时器
    CADisplayLink *timer;
    //惯性
    CADisplayLink *inertia;
    
}


@end

@implementation XLSphereView

//初始化
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //添加滑动手势
        UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        [self addGestureRecognizer:gesture];
    }
    return self;
}

#pragma mark - initial set

- (void)setItems:(NSArray *)items
{
    //设置标签数组
    tags = [NSMutableArray arrayWithArray:items];
    //初始化三维坐标数组
    coordinate = [[NSMutableArray alloc] initWithCapacity:0];
    
//    for (NSInteger i = 0; i < tags.count; i ++) {
//        UIView *view = [tags objectAtIndex:i];
//        view.center = CGPointMake(self.frame.size.width / 2., self.frame.size.height / 2.);
//    }
    
    CGFloat p1 = M_PI * (3 - sqrt(5));
    CGFloat p2 = 2. / tags.count;
    
    for (NSInteger i = 0; i < tags.count; i ++) {
        //设置位置
        CGFloat y = i * p2 - 1 + (p2 / 2);
        CGFloat r = sqrt(1 - y * y);
        CGFloat p3 = i * p1;
        CGFloat x = cos(p3) * r;
        CGFloat z = sin(p3) * r;
        //设置坐标
        XLPoint point = XLPointMake(x, y, z);
        NSValue *value = [NSValue value:&point withObjCType:@encode(XLPoint)];
        [coordinate addObject:value];
        
        CGFloat time = (arc4random() % 10 + 10.) / 20.;
        [UIView animateWithDuration:time delay:0. options:UIViewAnimationOptionCurveEaseOut animations:^{
            [self setTagOfPoint:point andIndex:i];
        } completion:^(BOOL finished) {
            
        }];
        
    }
    //初始化所有子控件添加完成后给球体视图一个随机方向
    NSInteger a =  arc4random() % 10 - 5;
    NSInteger b =  arc4random() % 10 - 5;
    normalDirection = XLPointMake(a, b, 0);
    //启动定时器
    [self timerStart];
}

#pragma mark - set frame of point
/**
 *  更新所有子控件的位置
 *
 *  @param index     每个子控件对应的数组下标
 *  @param direction 子控件旋转的方向
 *  @param angle     当前球体旋转的角度
 */
- (void)updateFrameOfPoint:(NSInteger)index direction:(XLPoint)direction andAngle:(CGFloat)angle
{
    
    NSValue *value = [coordinate objectAtIndex:index];
    XLPoint point;
    [value getValue:&point];
    
    XLPoint rPoint = XLPointMakeRotation(point, direction, angle);
    value = [NSValue value:&rPoint withObjCType:@encode(XLPoint)];
    coordinate[index] = value;
    
    [self setTagOfPoint:rPoint andIndex:index];
    
}

- (void)setTagOfPoint: (XLPoint)point andIndex:(NSInteger)index
{
    UIView *view = [tags objectAtIndex:index];
    view.center = CGPointMake((point.x + 1) * (self.frame.size.width / 2.), (point.y + 1) * self.frame.size.width / 2.);
    
    CGFloat transform = (point.z + 2) / 3;
    
    view.transform = CGAffineTransformScale(CGAffineTransformIdentity, transform, transform);
    
    view.layer.zPosition = transform;
    
    view.alpha = transform;
    //z坐标为负值，及子控件在球体背面时关闭交互，否则开启交互
    if (point.z < 0) {
        view.userInteractionEnabled = NO;
    }else {
        view.userInteractionEnabled = YES;
    }
}

#pragma mark - autoTurnRotation

- (void)timerStart
{
    //设置定时器
    timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(autoTurnRotation)];
    //设置定时器运行模式
    [timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}
- (void)timerStop
{
    //定时器停止
    [timer invalidate];
    //清空定时器
    timer = nil;
}
//球体自旋转
- (void)autoTurnRotation
{
    for (NSInteger i = 0; i < tags.count; i ++)
    {
    [self updateFrameOfPoint:i direction:normalDirection andAngle:0.006];
    }
}

#pragma mark - inertia

- (void)inertiaStart
{
    //关闭定时器
    [self timerStop];
    //重新设置定时器
    inertia = [CADisplayLink displayLinkWithTarget:self selector:@selector(inertiaStep)];
    [inertia addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)inertiaStop
{
    [inertia invalidate];
    inertia = nil;
    [self timerStart];
}

- (void)inertiaStep
{
    if (velocity <= 0) {
        [self inertiaStop];
    }else {
        velocity -= 70.;
        CGFloat angle = velocity / self.frame.size.width * 2. * inertia.duration;
        for (NSInteger i = 0; i < tags.count; i ++) {
            [self updateFrameOfPoint:i direction:normalDirection andAngle:angle];
        }
    }
    
}

#pragma mark - gesture selector

- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        last = [gesture locationInView:self];
        [self timerStop];
        [self inertiaStop];
        
    }else if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint current = [gesture locationInView:self];
        XLPoint direction = XLPointMake(last.y - current.y, current.x - last.x, 0);
        CGFloat distance = sqrt(direction.x * direction.x + direction.y * direction.y);
        CGFloat angle = distance / (self.frame.size.width / 2.);
        for (NSInteger i = 0; i < tags.count; i ++) {
        [self updateFrameOfPoint:i direction:direction andAngle:angle];
        }
        normalDirection = direction;
        last = current;
    }else if (gesture.state == UIGestureRecognizerStateEnded){
        CGPoint velocityP = [gesture velocityInView:self];
        velocity = sqrt(velocityP.x * velocityP.x + velocityP.y * velocityP.y);
        [self inertiaStart];
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
