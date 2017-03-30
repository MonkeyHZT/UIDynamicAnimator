//
//  UIView+SetOrigin.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/30.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "UIView+SetOrigin.h"

@implementation UIView (SetOrigin)

-(CGPoint)origin{
    return self.bounds.origin;
}
-(void)setOrigin:(CGPoint)origin{
    CGRect rectFrame = self.frame;
    rectFrame.origin = origin;
    self.frame = rectFrame;
}

@end
