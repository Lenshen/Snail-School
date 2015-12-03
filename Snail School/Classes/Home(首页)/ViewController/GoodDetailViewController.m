//
//  GoodDetailViewController.m
//  Snail School
//
//  Created by 远深 on 15/11/19.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "GoodDetailViewController.h"
#import "GoodDetailTableViewCellB.h"
#import "GoodDetailTableViewCellS.h"

@interface GoodDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation GoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self setNavigationParameter];
    [self setTableViewDelegate];
    //设定返回按钮
  
}
//设置navigation一些参数
-(void)setNavigationParameter
{
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationItem.backBarButtonItem.title = @"ss";
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectZero];
    [customLab setTextColor:[UIColor whiteColor]];
    customLab.textAlignment = NSTextAlignmentCenter;
    
    [customLab setText:@"商品详情"];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    [customLab sizeToFit];
}
//设置tableview的参数
-(void)setTableViewDelegate
{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
//    self.automaticallyAdjustsScrollViewInsets = NO;

}
//  tableView 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
    GoodDetailTableViewCellB *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodDetailTableViewCellB" forIndexPath:indexPath];
        return cell;
    }else
    {
        
    GoodDetailTableViewCellS *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodDetailTableViewCellS" forIndexPath:indexPath];
    return cell;
    }
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 303;
    }else
    {
        return 59;
    }
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//}





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
