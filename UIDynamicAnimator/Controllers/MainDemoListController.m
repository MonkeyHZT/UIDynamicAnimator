//
//  MainDemoListController.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "MainDemoListController.h"
#import "MainDemoListDelegate.h"
#import "MainDemoListDataSource.h"

@interface MainDemoListController ()

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic,strong)MainDemoListDelegate *tableViewDelegate;
@property (nonatomic,strong)MainDemoListDataSource *tableViewDataSource;

@end

@implementation MainDemoListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initControl];
}

- (void)initControl{
    self.navigationItem.title = @"物理碰撞Demo";
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

#pragma mark - 懒加载

-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
        _tableView.dataSource = self.tableViewDataSource;
        _tableView.delegate = self.tableViewDelegate;
    }
    return _tableView;
}
-(MainDemoListDelegate *)tableViewDelegate{
    if(!_tableViewDelegate){
        __weak typeof (self) weakSelf = self;
        _tableViewDelegate = [[MainDemoListDelegate alloc] initWithPushBlock:^(UIViewController *controller) {
            [weakSelf.navigationController pushViewController:controller animated:YES];
        }];
    }
    return _tableViewDelegate;
}
-(MainDemoListDataSource *)tableViewDataSource{
    if(!_tableViewDataSource){
        _tableViewDataSource = [[MainDemoListDataSource alloc] initWithArrAnimatorNames:@[@"吸附行为",@"推动行为",@"刚性附着行为",@"弹性附着行为",@"碰撞测试"]];
    }
    return _tableViewDataSource;
}

@end
