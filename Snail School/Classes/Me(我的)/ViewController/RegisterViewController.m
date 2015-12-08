//
//  RegisterViewController.m
//  Snail School
//
//  Created by 远深 on 15/12/7.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "RegisterViewController.h"
#import "SMSSDK.h"
#import "RegViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)black:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)registerUse:(id)sender {
    RegViewController* reg=[[RegViewController alloc] init];
    [self presentViewController:reg animated:YES completion:^{
        
    }];
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
