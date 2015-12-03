//
//  TriendViewController.m
//  Snail School
//
//  Created by 远深 on 15/11/9.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "TriendViewController.h"
#import "HuaTiTableViewCell.h"
#import "huaTiJsonModel.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

@interface TriendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activtyView;
@property (strong, nonatomic)huaTiJsonModel *jsonModel;

#define SecondHandTypeSaleUrl2 @"http://139.196.33.40/index.php/Topic/getTopics/begin/0/count/2"

@end

@implementation TriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self baseReadData];
}
-(void)baseReadData
{
    [self.activtyView startAnimating];
    
    [HomeAPI huatiDataWithUrl:SecondHandTypeSaleUrl2 success:^(id homeData) {
        self.jsonModel = homeData[0];
        [self.tableView reloadData];
        NSLog(@"%@",self.jsonModel);
        [self.activtyView stopAnimating];
        [self.activtyView setHidesWhenStopped:YES];
    } fail:^{
        [self.activtyView stopAnimating];
        [self.activtyView setHidesWhenStopped:YES];

    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HuaTiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"huaticell" forIndexPath:indexPath];
    
    NSString *str = [NSString stringWithFormat:@"http://139.196.33.40/%@",self.jsonModel.topic_cover];
    UIImageView *image = [[UIImageView alloc]init];
    [image sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"1"]];
    cell.huatiImage.image  = image.image;
    cell.huatiDesLabel.text = self.jsonModel.topic_desc;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* myView = [[UIView alloc] init];
    myView.backgroundColor = COLOR(236, 236, 236, 1);
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 200, 22)];
//    titleLabel.textColor=[UIColor whiteColor];
//    titleLabel.backgroundColor = [UIColor clearColor];
//    
//    if (section == 0){
//        titleLabel.text = @"本机设备";
//    }
//    else if (section == 1)
//    {
//        titleLabel.text = @"信息";
//    }
//    else
//    {
//        titleLabel.text = @"设置";
//    }
//    [myView addSubview:titleLabel];
    
    return myView;
}

-(CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
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
