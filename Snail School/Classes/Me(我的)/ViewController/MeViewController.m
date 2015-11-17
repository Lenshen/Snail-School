//
//  MeViewController.m
//  Snail School
//
//  Created by 远深 on 15/11/16.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "MeViewController.h"
#import "MeTableViewCell.h"

@interface MeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 1) {
        return 3;
    }else
        return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeCell" forIndexPath:indexPath];
    if (indexPath.section == 0 &&indexPath.row == 0) {
        cell.MeCellLabel.text = @"我的话题";
    }else if (indexPath.section == 1 &&indexPath.row == 0) {
        cell.MeCellLabel.text = @"我的二手";
    }else if (indexPath.section == 1 &&indexPath.row == 1) {
        cell.MeCellLabel.text = @"我的收藏";
    }else if (indexPath.section == 1 &&indexPath.row == 2) {
        cell.MeCellLabel.text = @"我的评价";
    }else
    {
        cell.MeCellLabel.text = @"设置";
    }
    
    
    return cell;
}


-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        return 1000;
    }
    return 20;
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
