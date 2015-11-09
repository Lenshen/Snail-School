//
//  HomeSearchTableViewCell.h
//  Snail School
//
//  Created by 远深 on 15/11/9.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeSearchTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *HSImage;
@property (weak, nonatomic) IBOutlet UILabel *HSTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *HSOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *HSTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *HSTreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *HSFourLabel;
@property (nonatomic)BOOL yesOrNo;
-(void)setTextLayoutWithLabel:(UILabel *)label
                       string:(NSString *)string;
-(void)setFourLabelHide:(BOOL)yesOrNo;


@end
