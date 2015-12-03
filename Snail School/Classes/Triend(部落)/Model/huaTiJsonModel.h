//
//  huaTiJsonModel.h
//  Snail School
//
//  Created by 远深 on 15/12/3.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"


@interface huaTiJsonModel : JSONModel
@property (assign, nonatomic) int topic_id;
@property (strong, nonatomic)NSString* topic_desc;
@property (strong, nonatomic) NSString* topic_cover;

@end
