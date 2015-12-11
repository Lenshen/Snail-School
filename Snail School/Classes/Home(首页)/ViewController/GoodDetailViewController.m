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
#import "HomeAPI.h"
#import "MJPhotoBrowser.h"
@interface GoodDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation GoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    [self setNavigationParameter];
    [self setTableViewDelegate];
    NSLog(@"lalalallalalalalalalalalalalall%@",self.self.jsonModel);
    //设定返回按钮
  
}
//设置navigation一些参数
-(void)setNavigationParameter
{
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
     
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
        NSString *str = [NSString stringWithFormat:@"http://139.196.33.40/%@",self.jsonModel.trader_icon];
        [HomeAPI homeDataWithUrl:str Image:nil button:cell.HomeCellUseImage];
        
        cell.HomeCellUseName.text = self.jsonModel.good_name;
        
        NSString *dateString = @"2015-12-3 18:50:29";
        
//        cell.timeLabel.text = [self compareCurrentTime:dateString];
        
        NSString *formStr = [NSString stringWithFormat:@"来自.%@",self.jsonModel.trader_university];
        
        NSString *strInt = [NSString stringWithFormat:@"%d",self.jsonModel.good_comment];
        cell.formLabel.text = formStr;
        cell.goodDesLabel.text = self.jsonModel.good_desc;
        cell.goodImageScrollView.contentSize = CGSizeMake(cell.goodImageScrollView.frame.size.width*self.jsonModel.img.count, cell.goodImageScrollView.frame.size.height);
        NSMutableArray *urlArray = [[NSMutableArray alloc]init];
        if (self.jsonModel.trader_isAuth == 0)
        {
            cell.vaildateImage.image = [UIImage imageNamed:@"已验证"];
        }else
        {
            cell.vaildateImage.image = [UIImage imageNamed:@"未验证"];
        }
        if (self.jsonModel.trader_sex == 0)
        {
            cell.sexImage.image = [UIImage imageNamed:@"女生"];
        }else
        {
            cell.sexImage.image = [UIImage imageNamed:@"男生"];
        }
        cell.goodImageScrollView.contentSize = CGSizeMake(cell.goodImageScrollView.frame.size.width*self.jsonModel.img.count, cell.goodImageScrollView.frame.size.height);
        cell.goodImageScrollView.pagingEnabled = YES;
        for(int i=0; i< self.jsonModel.img.count;i++)
        {
            UIImageView *imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(cell.goodImageScrollView.frame.size.width*i,0,cell.goodImageScrollView.frame.size.width,200)];
            
            [urlArray addObject:self.jsonModel.img[i]];
            UIImageView * image = [[UIImageView alloc]init];
            NSString *str = [NSString stringWithFormat:@"http://139.196.33.40/%@",self.jsonModel.img[i]];
            [image sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:nil]];
            
            
            imageView.image = image.image;
            
            [cell.goodImageScrollView addSubview:imageView];
        }
            return cell;
        }
        GoodDetailTableViewCellS *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodDetailTableViewCellS" forIndexPath:indexPath];
        return cell;
    
   

}
-(void)isAuth:(UIImage *)cellImage
{
    
}

    
    
-(NSString *)compareCurrentTime:(NSString *) compareDate
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        
        [formatter setDateFormat:@"yyyy-MM-dd H:mm:ss"];
        
        
        NSDate *date = [formatter dateFromString:compareDate];
        
        
        
        NSTimeInterval late = [date timeIntervalSince1970]*1;
        
        NSString * timeString = nil;
        
        NSDate * dat = [NSDate dateWithTimeIntervalSinceNow:0];
        
        NSTimeInterval now = [dat timeIntervalSince1970]*1;
        
        NSTimeInterval cha = now - late;
        if (cha/3600 < 1) {
            
            timeString = [NSString stringWithFormat:@"%f", cha/60];
            
            timeString = [timeString substringToIndex:timeString.length-7];
            
            int num= [timeString intValue];
            
            if (num <= 1) {
                
                timeString = [NSString stringWithFormat:@"刚刚..."];
                
            }else{
                
                timeString = [NSString stringWithFormat:@"%@分钟前", timeString];
                
            }
            
        }
        
        if (cha/3600 > 1 && cha/86400 < 1) {
            
            timeString = [NSString stringWithFormat:@"%f", cha/3600];
            
            timeString = [timeString substringToIndex:timeString.length-7];
            
            timeString = [NSString stringWithFormat:@"%@小时前", timeString];
            
        }
        
        if (cha/86400 > 1)
            
        {
            
            timeString = [NSString stringWithFormat:@"%f", cha/86400];
            
            timeString = [timeString substringToIndex:timeString.length-7];
            
            int num = [timeString intValue];
            
            if (num < 2) {
                
                timeString = [NSString stringWithFormat:@"昨天"];
                
            }else if(num == 2){
                
                timeString = [NSString stringWithFormat:@"前天"];
                
            }else if (num > 2 && num <7){
                
                timeString = [NSString stringWithFormat:@"%@天前", timeString];
                
            }else if (num >= 7 && num <= 10) {
                
                timeString = [NSString stringWithFormat:@"1周前"];
                
            }else if(num > 10){
                
                timeString = [NSString stringWithFormat:@"n天前"];
                
            }
            
        }
        return timeString;
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
