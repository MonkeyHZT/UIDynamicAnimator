//
//  DetailViewController.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "DetailViewController.h"
#import "BaseView.h"
#import "SnapView.h"
#import "PushView.h"
#import "AttachmentView.h"
#import "SpringView.h"
#import "ColideView.h"

@interface DetailViewController ()

@property(nonatomic,strong)BaseView *viewAnimator;

@end

@implementation DetailViewController

-(instancetype)initWithIntIndex:(NSInteger)intIndex{
    if(self = [super init]){
        self.intIndex = intIndex;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.viewAnimator];
}

- (void)initViewAnimator{
    switch (self.intIndex) {
        case 0:
            _viewAnimator = [[SnapView alloc] init];
            break;
        case 1:
            _viewAnimator = [[SnapView alloc] init];
            break;
        case 2:
            _viewAnimator = [[SnapView alloc] init];
            break;
        case 3:
            _viewAnimator = [[SnapView alloc] init];
            break;
        case 4:
            _viewAnimator = [[SnapView alloc] init];
            break;
        case 5:
            _viewAnimator = [[SnapView alloc] init];
            break;
            
        default:
            break;
    }
    _viewAnimator.frame = self.view.bounds;
}

#pragma mark - 懒加载
-(BaseView *)viewAnimator{
    if(!_viewAnimator){
        [self initViewAnimator];
    }
    return _viewAnimator;
}

@end
