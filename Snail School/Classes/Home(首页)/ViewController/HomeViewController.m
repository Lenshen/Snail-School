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
#import "GoodDetailViewController.h"
#import "HomeTableViewCell.h"
#import "HomeCollectionViewCell.h"
#define Kwidth [UIScreen mainScreen].bounds.size.width
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
@interface HomeViewController ()<UITabBarControllerDelegate,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;
@property (weak, nonatomic) HomeTableViewCell *cell;
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
@property (weak, nonatomic)  UIScrollView *cellScrollView;
@property (strong, nonatomic) UIImageView *cellImageView;
#define SecondHandTypeSaleUrl1 @"http://139.196.33.40/index.php/Good/getIndexGoods/begin/0/count/1/type/1"


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

    
    self.cellImageView = [[UIImageView alloc]init];
   
    
    
    
    
    

}

-(void)baseReadData
{
    [self.activtyView startAnimating];
    
    [HomeAPI homeDataWithUrl:SecondHandTypeSaleUrl1 success:^(id homeData) {
        self.jsonModel = homeData[0];
        [self.tableView reloadData];

        self.segmentController.selectedSegmentIndex = 0;

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
    [self.tableView reloadData];

    

}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    //一些navigationController的属性
    self.navigationController.navigationBar.hidden = YES;
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = barButtonItem;
    [self baseReadData];

    


}

//设置琐碎的参数
-(void)setTableViewDelegate
{
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.hideSegment.hidden = YES;
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
    if (sender == self.SegmentHideController) {
        self.segmentController.selectedSegmentIndex = sender.selectedSegmentIndex;
    }else
    {
        self.SegmentHideController.selectedSegmentIndex = sender.selectedSegmentIndex;
    }
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
    
}

#pragma mark 注册cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    
    NSString *str = [NSString stringWithFormat:@"http://139.196.33.40/%@",self.jsonModel.img[0]];
    [HomeAPI homeDataWithUrl:str Image:nil button:_cell.HomeCellUseImage];
    
    
    [HomeAPI homeDataWithjsonModel:self.jsonModel.img imageView:_cellImageView Scrollview:_cell.goodImageScrollView];
    
    _cell.HomeCellUseName.text = self.jsonModel.good_name;
   
    NSString *dateString = @"2015-12-3 18:50:29";

    _cell.timeLabel.text = [self compareCurrentTime:dateString];
    
    NSString *formStr = [NSString stringWithFormat:@"来自.%@",self.jsonModel.trader_university];
    
    NSString *strInt = [NSString stringWithFormat:@"%d",self.jsonModel.good_comment];
    _cell.goodComment.text = strInt;
    _cell.formLabel.text = formStr;
    _cell.goodDesLabel.text = self.jsonModel.good_desc;
    _cell.goodImageScrollView.contentSize = CGSizeMake(_cell.goodImageScrollView.frame.size.width*self.jsonModel.img.count, _cell.goodImageScrollView.frame.size.height);
    _cell.HomeCellCollection.delegate = self;
    _cell.HomeCellCollection.dataSource = self;
    if (self.jsonModel.trader_isAuth == 0) {
        _cell.vaildateImage.image = [UIImage imageNamed:@"已验证"];
    }else
    {
        _cell.vaildateImage.image = [UIImage imageNamed:@"未验证"];
    }
    if (self.jsonModel.trader_sex == 0)
    {
        _cell.sexImage.image = [UIImage imageNamed:@"女生"];
    }else
    {
        _cell.sexImage.image = [UIImage imageNamed:@"男生"];
    }
    [_cell.HomeCellCollection reloadData];
    
    return _cell;

    
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.jsonModel.img.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
    NSString *str = [NSString stringWithFormat:@"http://139.196.33.40/%@",self.jsonModel.img[indexPath.row]];

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        
        NSURL *url = [NSURL URLWithString:str];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.imageCell.image = image;
        });
        
    });
    
    return cell;
    
}

#pragma mark 时间转化

-(NSString *) compareCurrentTime:(NSString *) compareDate
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

#pragma mark  点击跳转

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodDetailViewController *goodD =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"GoodDetailViewController"];
    goodD.jsonModel = self.jsonModel;
    [self.navigationController pushViewController:goodD animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
