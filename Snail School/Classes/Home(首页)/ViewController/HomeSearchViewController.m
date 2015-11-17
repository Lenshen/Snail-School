//
//  HomeSearchViewController.m
//  
//
//  Created by 远深 on 15/11/9.
//
//

#import "HomeSearchViewController.h"
#import "HomeSearchTableViewCell.h"
#import "HomePreparationViewController.h"
#define Identifier @"HSIdentifier"
@interface HomeSearchViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    __weak IBOutlet UITableView *HomeSearchTableView;
    
}
@property (strong, nonatomic)NSArray *LabelTitleArray;
@property (strong, nonatomic)NSArray *LabelOneArray;
@property (strong, nonatomic)NSArray *LabelTwoArray;
@property (strong, nonatomic)NSArray *LabelTreeArray;
@property (strong, nonatomic)NSArray *LabelFourArray;


@end

@implementation HomeSearchViewController
- (IBAction)black:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    self.tabBarItem.enabled = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HomeSearchTableView.dataSource = self;
    HomeSearchTableView.delegate = self;
    [self initArray];


    


}
-(void)initArray
{
    if (!self.LabelTitleArray) {
        self.LabelTitleArray = @[@"学习",@"美妆护肤",@"服饰鞋帽",@"数码电子",@"运动户外",@"宿舍生活",@"其他"];
        self.LabelOneArray = @[@"书籍",@"化妆品",@"男装",@"手机",@"体育器材",@"热水瓶",@""];
        self.LabelTwoArray = @[@"画板",@"洗发护发",@"女装",@"电脑",@"运动鞋",@"电风扇",@""];
        self.LabelTreeArray = @[@"文具",@"清洁用品",@"箱包",@"单反相机",@"户外用品",@"桌椅",@""];

    }
   
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (iPhone4) {
        return 73;
    }
    else if (iPhone5) {
        return 73;
    }else if(iPhone6)
    {
        return 85;
    }else
    {
        return 100;
    
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [self.LabelTitleArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    HomeSearchTableViewCell *cell = [tableView
                                     dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    [cell setTextLayoutWithLabel:cell.HSTitleLabel string:self.LabelTitleArray[indexPath.row]];

    [cell setTextLayoutWithLabel:cell.HSOneLabel string:self.LabelTitleArray[indexPath.row]];
    [cell setTextLayoutWithLabel:cell.HSTwoLabel string:self.LabelTwoArray[indexPath.row]];
    [cell setTextLayoutWithLabel:cell.HSTreeLabel string:self.LabelTreeArray[indexPath.row]];
    [cell setTextLayoutWithLabel:cell.HSFourLabel string:self.LabelTwoArray[indexPath.row]];
    if (indexPath.row == 2) {
        [cell setFourLabelHide:NO];
        cell.HSFourLabel.text = @"配饰";
    }

    
        return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomePreparationViewController *HPViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomePreparationViewController"];
    [HPViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:HPViewController animated:YES completion:nil];
    
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
