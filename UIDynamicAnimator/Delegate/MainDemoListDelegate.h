//
//  MainDemoListDelegate.h
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MainDemoListDelegate : NSObject <UITableViewDelegate>

-(instancetype)initWithPushBlock:(void(^)(UIViewController *controller))pushBlock;

@end
