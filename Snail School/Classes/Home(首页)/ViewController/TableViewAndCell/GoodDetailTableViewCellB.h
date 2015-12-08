//
//  GoodDetailTableViewCellB.h
//  Snail School
//
//  Created by 远深 on 15/11/20.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodDetailTableViewCellB : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *HomeCellUseImage;
@property (weak, nonatomic) IBOutlet UILabel *HomeCellUseName;
@property (weak, nonatomic) IBOutlet UIImageView *HomeCellUseSex;
@property (weak, nonatomic) IBOutlet UILabel *formLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sexImage;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vaildateImage;
@property (weak, nonatomic) IBOutlet UILabel *goodDesLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *goodImageScrollView;
@property (weak, nonatomic)NSArray *cellArray;

@property (weak, nonatomic) IBOutlet UILabel *goodPrice;
@property (weak, nonatomic) IBOutlet UILabel *goodPrimePrice;
@end
