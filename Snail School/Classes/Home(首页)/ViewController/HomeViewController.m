//
//  HomeViewController.m
//  Snail School
//
//  Created by 远深 on 15/11/7.
//  Copyright © 2015年 himooo. All rights reserved.
//
#import "AFNetworking.h"
#import "AFURLRequestSerialization.h"
#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#import "PublishViewController.h"
#import "HomeModel.h"
#import "HomeAPI.h"
#import "homeManager.h"
#define Kwidth [UIScreen mainScreen].bounds.size.width
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface HomeViewController ()<UITabBarControllerDelegate,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (weak, nonatomic) IBOutlet UIView *hideSegment;
@property (weak, nonatomic) IBOutlet UISegmentedControl *SegmentHideController;
@property (weak, nonatomic) IBOutlet UIScrollView *haibaoScrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic)HomeModel *jsonModel;
@property (strong, nonatomic)NSArray *imgArray;
@property (strong, nonatomic)NSArray *json;
@property (strong, nonatomic)homeManager *homeManger;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activtyView;

#define SecondHandTypeSaleUrl1 @"http://139.196.33.40/index.php/Good/getIndexGoods/begin/0/count/1/type/4"


@end

@implementation HomeViewController
{
    NSInteger pageName;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.homeManger = [[homeManager alloc]init];
        [self setTableViewDelegate];

    [self baseReadData];
    
    
    

    
    
    

}
-(void)baseReadData
{
    [self.activtyView startAnimating];
    
    [HomeAPI homeDataWithUrl:SecondHandTypeSaleUrl1 success:^(id homeData) {
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
-(void)readData
{
    [self.activtyView startAnimating];

    [HomeAPI homeDataWithUrl:[self.homeManger requestSecondHandType] success:^(id homeData) {
        self.jsonModel = homeData[0];
        [self.tableView reloadData];
        [self.activtyView stopAnimating];
        [self.activtyView setHidesWhenStopped:YES];
        
    } fail:^{
        
    }];
    
}


//必须在 viewDidAppear 实现！scrollview的滑动！
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self setHaibaoScrollView];
    
    

}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //一些navigationController的属性
    self.navigationController.navigationBar.hidden = YES;
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = barButtonItem;
    
    


}

//设置琐碎的参数
-(void)setTableViewDelegate
{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.hideSegment.hidden = YES;
    [self.tableView reloadData];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(circulate:) userInfo:nil repeats:YES];
    [self.segmentController addTarget:self action:@selector(segmentControllerPressed:) forControlEvents:UIControlEventValueChanged];
    [self.SegmentHideController addTarget:self action:@selector(segmentControllerPressedhide:) forControlEvents:UIControlEventValueChanged];


    
}
//海报的一下参数
-(void)setHaibaoScrollView
{
    self.haibaoScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, self.haibaoScrollView.frame.size.height);
    
    //添加图片
    self.imgArray = @[@"1",@"2",@"3"];
    for (int i=0; i<_imgArray.count; i++) {
        self.imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(Kwidth*i,0,Kwidth,self.haibaoScrollView.bounds.size.height)];
        
        self.imageView.image = [UIImage imageNamed:_imgArray[i]];
        
        self.imageView.tag = i;
        
        [self.haibaoScrollView addSubview:self.imageView];
    }
    
    
    //添加 pageControl
    _pageControl.numberOfPages = _imgArray.count;
    _pageControl.currentPage = 0;
    [_pageControl addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
    
    
}

//海报定时和pageControl一些参数
- (void)pageAction:(UIPageControl *)control {
    NSInteger page = control.currentPage;
    [self.haibaoScrollView setContentOffset:CGPointMake(Kwidth*page,0) animated:YES];
}

//定时的原理

- (void)circulate:(NSTimer *)timer {
    
    pageName++;
    
    [self.haibaoScrollView  setContentOffset:CGPointMake(Kwidth*pageName, 0) animated:YES];
    _pageControl.currentPage = pageName;
    
    if (pageName == 2) {
        pageName = -1;
    }
    
}

//判断什么时候显示hideSegment
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y>=106) {
        self.hideSegment.hidden = NO;
        
    }else
        self.hideSegment.hidden = YES;
    NSLog(@"%f",scrollView.contentOffset.y);
}

//二手切换

-(void)segmentControllerPressed:(UISegmentedControl *)sender
{
    
    [self selectedSegmentIndex:self.segmentController];
    
}
-(void)segmentControllerPressedhide:(UISegmentedControl *)sender
{
    [self selectedSegmentIndex:self.SegmentHideController];
    
}

-(void)selectedSegmentIndex:(UISegmentedControl *)sender
{
    int selectedSegmentIndex = (int)sender.selectedSegmentIndex;
    
    NSLog(@"Segment %d selected\n", selectedSegmentIndex);
    
    switch (selectedSegmentIndex) {
        case 0:
            self.homeManger.homeSegmentType = 0;
            [self readData];
            [self.tableView reloadData];
            
            NSLog(@"%@", [self.homeManger requestSecondHandType]);
            break;
        case 1:
            self.homeManger.homeSegmentType = 1;
            [self readData];
            [self.tableView reloadData];
            
            NSLog(@"%@", [self.homeManger requestSecondHandType]);
            
            
            
            break;
        case 2:
            self.homeManger.homeSegmentType = 2;
            [self readData];
            [self.tableView reloadData];
            
            NSLog(@"%@", [self.homeManger requestSecondHandType]);
            
            
            
            break;
    }
    
    
}

//  tableView 代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    
    NSString *str = [NSString stringWithFormat:@"http://139.196.33.40/%@",self.jsonModel.trader_icon];
    NSLog(@"%@",str);
    NSString *dateString = @"2015-12-3 3:50:29";
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    
    [formatter setDateFormat:@"yyyy-MM-dd H:mm:ss"];
    
    
    NSDate *date = [formatter dateFromString:dateString];
    
    
  
    [HomeAPI homeDataWithUrl:str Image:nil button:cell.HomeCellUseImage];
   
    
    cell.HomeCellUseName.text = self.jsonModel.good_name;
    if (self.jsonModel.trader_isAuth == 1) {
        cell.vaildateImage.image = [UIImage imageNamed:@"已验证"];
    }
    if (self.jsonModel.trader_sex == 1)
    {
        cell.sexImage.image = [UIImage imageNamed:@"女生"];
    }
    cell.timeLabel.text = [self compareCurrentTime:date];
    NSString *formStr = [NSString stringWithFormat:@"来自.%@",self.jsonModel.trader_university];
    
    cell.formLabel.text = formStr;
    cell.goodDesLabel.text = self.jsonModel.good_desc;
    cell.goodImageScrollView.contentSize = CGSizeMake(cell.goodImageScrollView.frame.size.width*self.jsonModel.img.count, cell.goodImageScrollView.frame.size.height);
     NSMutableArray *urlArray = [[NSMutableArray alloc]init];
    for(int i=0; i< self.jsonModel.img.count; i++) {
        UIImageView *imageView  = [[UIImageView alloc] initWithFrame:CGRectMake(cell.goodImageScrollView.frame.size.width*i,0,cell.goodImageScrollView.frame.size.width,200)];
        
        NSLog(@"dddddddddd%@",self.jsonModel.img[1]);
        
        [urlArray addObject:self.jsonModel.img[i]];
        UIImageView * image = [[UIImageView alloc]init];
        NSString *str = [NSString stringWithFormat:@"http://139.196.33.40/%@",self.jsonModel.img[i]];
        [image sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:nil]];
        

        imageView.image = image.image;
        
        
        
        [cell.goodImageScrollView addSubview:imageView];
    }


    
  
    return cell;
    
}

-(NSString *) compareCurrentTime:(NSDate *) compareDate
{
    
    NSTimeInterval late = [compareDate timeIntervalSince1970]*1;
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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
