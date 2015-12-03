//
//  HomeTableViewCell.h
//  Snail School
//
//  Created by 远深 on 15/11/17.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "HomeAPI.h"
#import "HomeModel.h"

@interface HomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *HomeCellUseImage;
@property (weak, nonatomic) IBOutlet UILabel *HomeCellUseName;
@property (weak, nonatomic) IBOutlet UIImageView *HomeCellUseSex;
@property (weak, nonatomic) IBOutlet UILabel *formLabel;
@property (weak, nonatomic) IBOutlet UIImageView *sexImage;
//
@property (weak, nonatomic) IBOutlet UIImageView *vaildateImage;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *goodDesLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *goodImageScrollView;
@property (strong, nonatomic)HomeModel *jsonModel;
@property (weak, nonatomic)NSArray *cellArray;


@end
