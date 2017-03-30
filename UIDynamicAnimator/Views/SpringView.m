//
//  SpringView.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "SpringView.h"

@implementation SpringView

-(void)initAction{
    [super initAction];
    
    self.attachmentBehavior.frequency = 0.5;  // 频率,hz
    self.attachmentBehavior.damping = 0.5;   // 振幅
    
    [self.viewBox addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if(![keyPath isEqualToString:@"center"]){
        return;
    }
    [self setNeedsDisplay];
}
-(void)dealloc{
    [self.viewBox removeObserver:self forKeyPath:@"center"];
}

@end
