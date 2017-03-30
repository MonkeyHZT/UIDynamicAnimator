//
//  AttachmentView.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "AttachmentView.h"
#import "RoundLayer.h"

@interface AttachmentView ()

@property(nonatomic,strong)RoundLayer *layerStart;//手指位置
@property(nonatomic,strong)RoundLayer *layerEnd;//位于viewBox中

@property (nonatomic,assign)CGPoint pointTouch;//手指当前位置

@property (nonatomic,strong)UIAttachmentBehavior *attachmentBehavior;//附着行为

@end

@implementation AttachmentView

-(void)initAction{
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:panGesture];
    [self.animator removeAllBehaviors];
    [self.animator addBehavior:self.attachmentBehavior];
    
    [self.layer addSublayer:self.layerStart];
    [self.viewBox.layer addSublayer:self.layerEnd];
    self.pointTouch = CGPointMake(100, 100);
    [self setNeedsDisplay];
}

- (void)panAction:(UIPanGestureRecognizer *)panGesture{
    self.pointTouch = [panGesture locationInView:self];
    switch (panGesture.state) {
        case UIGestureRecognizerStateChanged:
        {
            self.layerStart.position = self.pointTouch;
            // 修改附着行为的附着点
            self.attachmentBehavior.anchorPoint = self.pointTouch;
            [self setNeedsDisplay];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 绘制
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:self.layerStart.position];
    CGPoint endP = [self convertPoint:self.layerEnd.position fromView:self.viewBox];
    [bezierPath addLineToPoint:endP];
    [bezierPath setLineWidth:10.f];
    [[UIColor grayColor] setStroke];
    bezierPath.lineCapStyle = kCGLineJoinRound;
    [bezierPath stroke];
    
}


#pragma mark - 懒加载

-(RoundLayer *)layerStart{
    if(!_layerStart){
        _layerStart = [[RoundLayer alloc] init];
    }
    return _layerStart;
}
-(RoundLayer *)layerEnd{
    if(!_layerEnd){
        _layerEnd = [[RoundLayer alloc] init];
        _layerEnd.frame = CGRectMake(self.viewBox.bounds.size.width * 0.5 - 10, self.viewBox.bounds.size.height * 0.5 - 10, 15, 15);
    }
    return _layerEnd;
}

-(UIAttachmentBehavior *)attachmentBehavior{
    if(!_attachmentBehavior){
        
        // 附着点
        CGPoint anchor = self.viewBox.center;
        anchor.x-=150;
        self.layerStart.position = anchor;
        UIOffset offset = UIOffsetMake(-10, -10);
        _attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.viewBox offsetFromCenter:offset attachedToAnchor:anchor];
        
    }
    return _attachmentBehavior;
}


@end
