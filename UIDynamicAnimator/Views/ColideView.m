//
//  ColideView.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "ColideView.h"

@interface ColideView ()<UICollisionBehaviorDelegate>

@property (nonatomic,strong)UIButton *btnReset;
@property (nonatomic,strong)UIButton *btnStart;
@property (nonatomic,strong)NSMutableArray *arrPaths;
@property (nonatomic,strong)LineModel *lineModel;
@property (nonatomic,strong)UIGravityBehavior *gravityBehavior;//重力
@property (nonatomic,strong)UICollisionBehavior *collisionBehavior;//边缘检测

@end

@implementation ColideView

-(UIGravityBehavior *)gravityBehavior{
    if(!_gravityBehavior){
        _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.viewBox]];
    }
    return _gravityBehavior;
}

-(void)initAction{
    [self addSubview:self.btnReset];
    [self addSubview:self.btnStart];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:panGesture];
    
    // 2. 添加重力行为
//    UIGravityBehavior * gravity = [[UIGravityBehavior alloc] initWithItems:@[self.viewBox]];
//    // 2.1 添加
//    [self.animator addBehavior:gravity];
    
    // 3. 设置边缘检测
    [self.animator addBehavior:self.collisionBehavior];
//    UICollisionBehavior * collision = [[UICollisionBehavior alloc] initWithItems:@[self.box]];
//    
//    // 设置代理
//    collision.collisionDelegate = self;
//    
//    collision.translatesReferenceBoundsIntoBoundary = YES;
//    
//    // 3.1 添加边缘
//    [collision addBoundaryWithIdentifier:@"ddd" fromPoint:CGPointMake(0, 300) toPoint:CGPointMake(180, 300)];
//    
//    // 3.1 添加
//    [self.animator addBehavior:collision];
    
    // 4.物体的属性行为
    UIDynamicItemBehavior *item = [[UIDynamicItemBehavior alloc] initWithItems:@[self.viewBox]];
    item.elasticity = 1.0;
    [self.animator addBehavior:item];

    
    
}

- (void)panAction:(UIPanGestureRecognizer *)panGesture{
    CGPoint touchPoint = [panGesture locationInView:self];
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.lineModel = [[LineModel alloc] init];
            [self.arrPaths addObject:self.lineModel];
            self.lineModel.pointStart = touchPoint;
        }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            self.lineModel.pointEnd = touchPoint;
        }
            break;
            
        case UIGestureRecognizerStateEnded:
        {
            self.lineModel = nil;
        }
            break;
            
        default:
            break;
    }
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath setLineWidth:10];
    [[UIColor grayColor] setStroke];
    [self.arrPaths enumerateObjectsUsingBlock:^(LineModel  *lineModel, NSUInteger idx, BOOL * _Nonnull stop) {
        if(CGPointEqualToPoint(lineModel.pointEnd, CGPointZero)){
            return ;
        }
        [bezierPath moveToPoint:lineModel.pointStart];
        [bezierPath addLineToPoint:lineModel.pointEnd];
    }];
    [bezierPath stroke];
}


#pragma mark - 按钮事件

- (void)btnResetAction:(UIButton *)sender{
    [self.arrPaths removeAllObjects];
    self.viewBox.center = CGPointMake(self.center.x, 50);
    [self setNeedsDisplay];
    
    
    
    //物理对象等
    [self.animator removeBehavior:self.gravityBehavior];
    [self.collisionBehavior removeAllBoundaries];
}

- (void)btnStartAction:(UIButton *)sender{
    
    [self.animator addBehavior:self.gravityBehavior];
    
//    [collision addBoundaryWithIdentifier:@"ddd" fromPoint:CGPointMake(0, 300) toPoint:CGPointMake(180, 300)];
    [self.arrPaths enumerateObjectsUsingBlock:^(LineModel  *lineModel, NSUInteger idx, BOOL * _Nonnull stop) {
        
    }];
}


#pragma mark - 懒加载

-(UIButton *)btnReset{
    if(!_btnReset){
        _btnReset = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnReset setTitle:@"重置" forState:UIControlStateNormal];
        [_btnReset setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btnReset setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        _btnReset.backgroundColor = [UIColor grayColor];
        _btnReset.frame = CGRectMake(20, 30, 60, 30);
        [_btnReset addTarget:self action:@selector(btnResetAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnReset;
}

-(UIButton *)btnStart{
    if(!_btnStart){
        _btnStart = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnStart setTitle:@"开始" forState:UIControlStateNormal];
        [_btnStart setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btnStart setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        _btnStart.backgroundColor = [UIColor grayColor];
        _btnStart.frame = CGRectMake(self.bounds.size.width - 20 - 60, 30, 60, 30);
        [_btnStart addTarget:self action:@selector(btnStartAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnStart;
}

-(NSMutableArray *)arrPaths{
    if(!_arrPaths){
        _arrPaths = [NSMutableArray array];
    }
    return _arrPaths;
}
-(UICollisionBehavior *)collisionBehavior{
    if(!_collisionBehavior){
        _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.viewBox]];
        _collisionBehavior.collisionDelegate = self;
        _collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    }
    return _collisionBehavior;
}

@end

@implementation LineModel
@end
