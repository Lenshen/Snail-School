//
//  HomeAPI.h
//  Snail School
//
//  Created by 远深 on 15/12/2.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "HomeModel.h"
#import "huaTiJsonModel.h"

@interface HomeAPI : NSObject
@property (nonatomic, strong)HomeModel *jsonModel;
+(void)homeDataWithUrl:(NSString *)urlString
               success:(void(^)(id homeData))success
                  fail:(void(^)())fail;
+(void)huatiDataWithUrl:(NSString *)urlString
               success:(void(^)(id homeData))success
                  fail:(void(^)())fail;
+(void)homeDataWithUrl:(NSArray *)urlString

             mutoArray:(NSMutableArray *)imageArray;
+(void)homeDataWithUrl:(NSString *)urlString
                 Image:(UIImageView *)image
                button:(UIButton *)button
;
+(void)homeDataWithjsonModel:(NSArray *)jsonModelImg
                   imageView:(UIImageView *)cellImageView
                  Scrollview:(UIScrollView *)scrollview;
+(UIImage *)imageWithJsonString:(NSString *)jsonString;
@end
