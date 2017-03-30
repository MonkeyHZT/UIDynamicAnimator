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

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]];
        [self addSubview:self.viewBox];
        [self initCollisionBehavior];
        [self initAction];
    }
    return self;
}
- (void)initAction{
    
}
- (void)initCollisionBehavior{
    //边缘检测
    UICollisionBehavior * collision = [[UICollisionBehavior alloc] initWithItems:@[self.viewBox]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
//    collision.collisionDelegate = self;
//    collision.collisionMode = UICollisionBehaviorModeBoundaries;
    [self.animator addBehavior:collision];
}
//- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{
//    NSLog(@"好疼，我撞在%f,%f，%@",p.x,p.y,identifier);
//}


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
