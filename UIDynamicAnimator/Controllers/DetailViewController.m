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

@interface DetailViewController ()<UIGestureRecognizerDelegate>

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
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.viewAnimator];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)initViewAnimator{
    CGRect frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64);
    switch (self.intIndex) {
        case 0:
            _viewAnimator = [[SnapView alloc] initWithFrame:frame];
            break;
        case 1:
            _viewAnimator = [[PushView alloc] initWithFrame:frame];
            break;
        case 2:
            _viewAnimator = [[AttachmentView alloc] initWithFrame:frame];
            break;
        case 3:
            _viewAnimator = [[SpringView alloc] initWithFrame:frame];
            break;
        case 4:
            _viewAnimator = [[ColideView alloc] initWithFrame:frame];
            break;
            
        default:
            break;
    }
}

#pragma mark - 懒加载
-(BaseView *)viewAnimator{
    if(!_viewAnimator){
        [self initViewAnimator];
    }
    return _viewAnimator;
}

@end
