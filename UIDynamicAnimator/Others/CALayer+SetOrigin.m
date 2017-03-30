//
//  CALayer+SetOrigin.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/30.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "CALayer+SetOrigin.h"

@implementation CALayer (SetOrigin)

-(CGPoint)origin{
    return self.bounds.origin;
}
-(void)setOrigin:(CGPoint)origin{
    CGRect rectFrame = self.frame;
    rectFrame.origin = origin;
    self.frame = rectFrame;
}

-(CGPoint)center{
    return self.position;
}

-(void)setCenter:(CGPoint)center{
    self.position = center;
}

@end
