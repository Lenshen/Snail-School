//
//  MySecondHandViewController.m
//  
//
//  Created by 远深 on 15/12/11.
//
//

#import "MySecondHandViewController.h"
#import "MySecondHandCell.h"
#import "MySecondHandCollectionViewCell.h"

@interface MySecondHandViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation MySecondHandViewController
{
    __weak IBOutlet UITableView *mySecondTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mySecondTableView.dataSource = self;
    mySecondTableView.delegate = self;
    [self setNavigationParameter];
}
-(void)setNavigationParameter
{
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectZero];
    [customLab setTextColor:[UIColor whiteColor]];
    customLab.textAlignment = NSTextAlignmentCenter;
    
    [customLab setText:@"我二手"];
    customLab.font = [UIFont boldSystemFontOfSize:20];
    self.navigationItem.titleView = customLab;
    [customLab sizeToFit];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MySecondHandCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mySecondHandCell" forIndexPath:indexPath];
    cell.mySecondHandCollection.dataSource = self;
    cell.mySecondHandCollection.delegate = self;
    
    return cell;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MySecondHandCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MySecondHandCollectionViewCell" forIndexPath:indexPath];
    cell.mySecondHandCellImage.image = [UIImage imageNamed:@"1"];
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
