//
//  HomeSearchTableViewCell.m
//  Snail School
//
//  Created by 远深 on 15/11/9.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "HomeSearchTableViewCell.h"


@implementation HomeSearchTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTextLayoutWithLabel:(UILabel *)label
                       string:(NSString *)string
{
    label.text = string;
    label.frame = CGRectMake(50, 80, 60, 150);
    [label sizeToFit];
    [self setFourLabelHide:YES];
    

}
-(void)setFourLabelHide:(BOOL)yesOrNo

{
    _yesOrNo = yesOrNo;
    self.HSFourLabel.hidden = _yesOrNo;
}

@end
