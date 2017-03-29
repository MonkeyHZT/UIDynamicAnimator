//
//  MainDemoListDelegate.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "MainDemoListDelegate.h"
#import "DetailViewController.h"

@interface MainDemoListDelegate ()

@property (nonatomic,copy)void(^pushBlock)(UIViewController *controller);

@end


@implementation MainDemoListDelegate

-(instancetype)initWithPushBlock:(void(^)(UIViewController *controller))pushBlock{
    if(self = [super init]){
        self.pushBlock = pushBlock;
    }
    return self;
}

#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSAssert(self.pushBlock, @"必须设置pushBlock");
    NSInteger intIndex = indexPath.row;
    DetailViewController *controller = [[DetailViewController alloc] initWithIntIndex:intIndex];
    
    self.pushBlock(controller);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
