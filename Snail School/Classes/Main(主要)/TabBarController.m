//
//  TabBarController.m
//  蜗牛校园
//
//  Created by 远深 on 15/9/4.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import "TabBarController.h"
#import "PublishViewController.h"

@interface TabBarController ()
@end

@implementation TabBarController
#pragma mark - 要动手术的地方

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"发布"]];
    
    _button=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-50, self.view.frame.size.height - 120 , 49, self.image.frame.size.width)];
    
    [_button setBackgroundImage:[UIImage imageNamed:@"发布"] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(loginRongCloud) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    if (self.tabBarController.tabBar.hidden) {
    }

    _button.hidden = NO;


    

}




-(void)buttonHidden
{
    _button.hidden = YES;

    
}
-(void)loginRongCloud
{
    NSLog(@"dianjilllll");
    [self AlertViewAddfirstSting:@"二手出售" secondSting:@"二手出租" treeSting:@"以物换物" cancelString:@"取消" tag:1];
}
-(void)AlertViewAddfirstSting:(NSString *)firstSting
                  secondSting:(NSString *)secondSting
                  treeSting:(NSString *)treeSting
                  cancelString:(NSString *)cancelSting
                          tag:(NSInteger )tag;
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:nil
                                                   delegate:self
                                          cancelButtonTitle:cancelSting
                                          otherButtonTitles:firstSting,secondSting,nil];
    //设置标题与信息，通常在使用frame初始化AlertView时使用
    
    //这个属性继承自UIView，当一个视图中有多个AlertView时，可以用这个属性来区分
    alert.tag = tag;
    //只读属性，看AlertView是否可见
    NSLog(@"%d",alert.visible);
    //通过给定标题添加按钮
    //按钮总数
    [alert addButtonWithTitle:treeSting];
    
    
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
       
    }
    if (buttonIndex == 1) {
        
        [self pushPublishViewController];
    }
    

}
-(void)pushPublishViewController
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PublishViewController  *publishViewController = [storyboard instantiateViewControllerWithIdentifier:@"publishViewController"];
    [publishViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:publishViewController animated:YES completion:nil];
    
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
