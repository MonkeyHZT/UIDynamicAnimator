//
//  BaseView.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "BaseView.h"

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)

@implementation BaseView

-(instancetype)init{
    if(self = [super init]){
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]];
        [self initAction];
    }
    return self;
}

- (void)initAction{
    
}


#pragma mark - 懒加载

-(UIDynamicAnimator *)animator {
    if(!_animator){
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    }
    return _animator;
}
-(UIView *)viewBox{
    if(!_viewBox){
        _viewBox = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box"]];
        _viewBox.center = CGPointMake(kScreenWidth * 0.5, kScreenHeight * 0.3);
    }
    return _viewBox;
}

@end
