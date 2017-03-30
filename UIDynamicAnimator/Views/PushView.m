//
//  PushView.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "PushView.h"
#import "CALayer+SetOrigin.h"
#import "RoundLayer.h"

@interface PushView ()

@property(nonatomic,strong)RoundLayer *roundLayer;//没有用户交互.使用CALayer提升性能
@property(nonatomic,assign)CGPoint pointCurrent;
@property(nonatomic,strong)UIPushBehavior *pushBehavior;

@end

//?为什么改变CALayer的位置会出现动画效果?


@implementation PushView

-(void)initAction{
    [self.animator addBehavior:self.pushBehavior];
    [self.layer addSublayer:self.roundLayer];
    self.pointCurrent = CGPointZero;
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:panGesture];
    
}
- (void)panAction:(UIGestureRecognizer *)panGesture{
    CGPoint touchPoint = [panGesture locationInView:self];
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan://开始
        {
            //修改起点layer的位置
            self.roundLayer.position = touchPoint;
            self.pointCurrent = touchPoint;
            self.roundLayer.hidden = NO;
        }
            break;
        case UIGestureRecognizerStateChanged://中途
        {
            //记录
            self.pointCurrent = touchPoint;
        }
            break;
        case UIGestureRecognizerStateEnded://结束
        {
            self.pointCurrent = self.roundLayer.position;
            self.roundLayer.hidden = YES;
            
            CGFloat offsetX = touchPoint.x - self.roundLayer.position.x;
            CGFloat offsetY = touchPoint.y - self.roundLayer.position.y;
            self.pushBehavior.pushDirection = CGVectorMake(offsetX * 0.1, offsetY * 0.1);
            self.pushBehavior.active = YES;
        }
            break;
        case UIGestureRecognizerStateFailed://失败
        {
            self.pointCurrent = self.roundLayer.position;
            self.roundLayer.hidden = YES;
        }
            break;
            
        default:
            break;
    }
    [self setNeedsDisplay];
}

#pragma mark - 方法重写

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:self.roundLayer.center];
    [bezierPath addLineToPoint:self.pointCurrent];
    [bezierPath setLineWidth:CGPointEqualToPoint(self.pointCurrent, CGPointZero)?0:10];
    [[UIColor grayColor] setStroke];
    [bezierPath stroke];

}

#pragma mark - 懒加载

-(RoundLayer *)roundLayer{
    if(!_roundLayer){
        _roundLayer = [[RoundLayer alloc] init];
        _roundLayer.hidden = YES;
    }
    return _roundLayer;
}
-(UIPushBehavior *)pushBehavior{
    if(!_pushBehavior){
        _pushBehavior = [[UIPushBehavior alloc] initWithItems:@[self.viewBox] mode:UIPushBehaviorModeInstantaneous];
    }
    return _pushBehavior;
}


@end
