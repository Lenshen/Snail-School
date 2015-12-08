//
//  SettingPassWordViewController.m
//  Snail School
//
//  Created by 远深 on 15/12/7.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "SettingPassWordViewController.h"
#import "SettingPWTableViewCell.h"

@interface SettingPassWordViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SettingPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.settingPWTableview.delegate = self;
    self.settingPWTableview.dataSource = self;
    self.settingPWTableview.scrollEnabled = NO;
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//     [self.view endEditing:YES];
    [self.settingPWTableview endEditing:YES];

}
- (IBAction)black:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingPWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingPWCell" forIndexPath:indexPath];
    if (indexPath.section == 1 && indexPath.row == 0) {
        cell.passWordTextFeild.placeholder = @"两次密码输入要一致";
    }
    return cell;
    
    
}

-(NSString* )tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"                    恭喜你注册成功！";

    }else
        
        return @"";
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 1000;
    }
    
    return 60;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1)
    {
    NSString *key = @"密码由6-20位英文字母，数字和符号组成";
    
    
    // create the parent view that will hold header Label
    
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(00.0, 0.0, 300.0, 44.0)];
    
    
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    headerLabel.backgroundColor = [UIColor clearColor];
    
    headerLabel.opaque = NO;
    
    headerLabel.textColor = [UIColor blackColor];
    
    headerLabel.highlightedTextColor = [UIColor grayColor];
    
    headerLabel.font = [UIFont italicSystemFontOfSize:10];
    headerLabel.numberOfLines = 2;
    
    headerLabel.frame = CGRectMake(20.0, 0.0, 300, 60.0);
    
    headerLabel.text = key;
    UIColor *color = [UIColor colorWithRed:229.0/255 green:230.0/255 blue:231.0/255 alpha:1.0];
    customView.backgroundColor = color;
    
    [customView addSubview:headerLabel];
    
    return customView;
    }
    return  nil;
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
