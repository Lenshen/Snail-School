//
//  TabBarController.h
//  蜗牛校园
//
//  Created by 远深 on 15/9/4.
//  Copyright (c) 2015年 yance.bao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarController : UITabBarController
@property (nonatomic , strong)UIImageView *image;
@property (nonatomic , strong)UIButton *button;
@property (nonatomic)BOOL isOk;
-(void)buttonHidden;
@end
