//
//  HomeTableViewCell.m
//  Snail School
//
//  Created by 远深 on 15/11/17.
//  Copyright © 2015年 himooo. All rights reserved.
//
#define Kwidth self.goodImageScrollView.bounds.size.width
#define SecondHandTypeSaleUrl1 @"http://139.196.33.40/index.php/Good/getIndexGoods/begin/0/count/1/type/1"

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.goodImageScrollView.pagingEnabled = YES;
  

}





    
    //添加图片

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
