//
//  RoundLayer.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/30.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "RoundLayer.h"
#import <UIKit/UIKit.h>

@implementation RoundLayer

-(instancetype)init{
    if(self = [super init]){
        self.frame = CGRectMake(0, 0, 15, 15);
        self.backgroundColor = [[UIColor blueColor] CGColor];
        self.masksToBounds = YES;
        self.cornerRadius = 15 * 0.5;
    }
    return self;
}

@end
