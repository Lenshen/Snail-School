//
//  PublishViewController.m
//  Snail School
//
//  Created by 远深 on 15/11/19.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "PublishViewController.h"
#import "UIView+LQXkeyboard.h"
#define ScreenWidth self.view.bounds.size.width
#define ScreenHeight self.view.bounds.size.height

@interface PublishViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *addImageButton;
@property (assign, nonatomic) CGRect keyboardField;
@property (assign, nonatomic)int i;


@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.i = self.addImageButton.frame.size.width;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    self.priceTextField.delegate = self;
    self.originalPrice.delegate =self;
   
    
    

    
}
-(void)keyboardWillChangeFrame:(NSNotification *)notification
{
    NSDictionary *useInfo = notification.userInfo;
    CGRect keyboardF = [useInfo[UIKeyboardFrameEndUserInfoKey]CGRectValue];
    self.keyboardField = keyboardF;
    self.view.tag = 3;

    [UIView animateWithDuration:1 animations:^{
               if (keyboardF.origin.y >self.view.height) {
//            self.priceView.y = self.view.height - self.priceView.height;
//                   self.priceView.y = keyboardF.origin.y - self.priceView.height;
            
        }else
        {
            self.priceView.y = keyboardF.origin.y - self.priceView.height;
        }
    }];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
- (IBAction)addImage:(UIButton *)sender {
    self.i += 10;

    self.addImageButton.frame = CGRectMake(self.addImageButton.frame.origin.x+self.i, 207, self.addImageButton.frame.size.width, self.addImageButton.frame.size.height);
    
    if (self.addImageButton.frame.origin.x >= 320) {
        self.addImageButton.frame = CGRectMake(20, 207+100, self.addImageButton.frame.size.width, self.addImageButton.frame.size.height);
        sender.enabled = NO;
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"上传照片不能超过4张哦！"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];

    }
    

}

- (IBAction)black:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    if (![self.originalPrice isExclusiveTouch]) {
//        [self.originalPrice resignFirstResponder];
//    }
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
