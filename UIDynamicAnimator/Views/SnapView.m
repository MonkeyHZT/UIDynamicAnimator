//
//  SnapView.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "SnapView.h"
//吸附行为

@interface SnapView ()

@property (nonatomic,strong)UISnapBehavior *snapBehavior;

@end

@implementation SnapView

- (void)initAction{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tapGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:panGesture];
}

- (void)tapAction:(UIGestureRecognizer *)tapGesture{
    CGPoint touchPoint = [tapGesture locationInView:self];
    //snapPoint属性于iOS 9.0出现
    if(!self.snapBehavior || ([[[UIDevice currentDevice] systemVersion] floatValue] < 9.0)){
        [self resetSnapBehaviorWithPoint:touchPoint];
    }
    else{
        self.snapBehavior.snapPoint = touchPoint;
    }
    
}

- (void)resetSnapBehaviorWithPoint:(CGPoint)point{
    [self.animator removeBehavior:self.snapBehavior];
    self.snapBehavior = [[UISnapBehavior alloc] initWithItem:self.viewBox snapToPoint:point];
    self.snapBehavior.damping = 1;
    [self.animator addBehavior:self.snapBehavior];
}

@end
