//
//  DetailViewController.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "DetailViewController.h"
#import "BaseView.h"

@interface DetailViewController ()

@property(nonatomic,strong)BaseView *viewAnimator;

@end

@implementation DetailViewController

-(instancetype)initWithIntIndex:(NSInteger)intIndex{
    if(self = [super init]){
        self.intIndex = intIndex;
        [self.view addSubview:self.viewAnimator];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
