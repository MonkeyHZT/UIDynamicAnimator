//
//  MainDemoListDataSource.m
//  UIDynamicAnimator
//
//  Created by 侯志桐Work on 17/3/29.
//  Copyright © 2017年 BlackMonkey. All rights reserved.
//

#import "MainDemoListDataSource.h"

@interface MainDemoListDataSource ()

@end

@implementation MainDemoListDataSource

-(instancetype)initWithArrAnimatorNames:(NSArray *)arrAnimatorNames{
    if(self = [super init]){
        self.arrAnimatorNames = arrAnimatorNames;
    }
    return self;
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrAnimatorNames.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    NSString *strAnimatorName = self.arrAnimatorNames[indexPath.row];
    cell.textLabel.text = strAnimatorName;
    return cell;
}




@end
