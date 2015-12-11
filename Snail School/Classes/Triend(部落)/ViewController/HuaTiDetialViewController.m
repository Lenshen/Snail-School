//
//  HuaTiDetialViewController.m
//  Snail School
//
//  Created by 远深 on 15/12/8.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "HuaTiDetialViewController.h"
#import "HuaiTiDetailTableViewCell.h"
@interface HuaTiDetialViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *tableHeaderView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HuaTiDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self setNavigationParameter];
}
-(void)setNavigationParameter
{
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectZero];
    [customLab setTextColor:[UIColor whiteColor]];
    customLab.textAlignment = NSTextAlignmentCenter;
    
    [customLab setText:@"商品详情"];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    [customLab sizeToFit];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HuaiTiDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HuaiTiDetailTableViewCell" forIndexPath:indexPath];
    return cell;
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
