//
//  MainDemoListDataSource.h
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define kCellIdentifier (@"CellIdentifier")

@interface MainDemoListDataSource : NSObject <UITableViewDataSource>

@property (nonatomic,strong)NSArray *arrAnimatorNames;

-(instancetype)initWithArrAnimatorNames:(NSArray *)arrAnimatorNames;

@end
