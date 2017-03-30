//
//  BaseView.h
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

@property (nonatomic,strong)UIView *viewBox;

@property (nonatomic,strong)UIDynamicAnimator *animator;

//子类实现
- (void)initAction;

@end
