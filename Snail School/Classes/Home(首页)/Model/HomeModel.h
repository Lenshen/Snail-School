//
//  HomeModel.h
//  Snail School
//
//  Created by 远深 on 15/11/30.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

//@protocol HomeimageModel
//
//@end

@interface HomeimageModel : JSONModel


@end


@interface HomeModel : JSONModel

@property (assign, nonatomic) int good_id;
@property (strong, nonatomic) NSString* good_name;
@property (strong, nonatomic) NSString* good_desc;
@property (strong, nonatomic) NSString* good_time;
//@property (assign, nonatomic) float good_rent;
//@property (assign, nonatomic) int good_prime_price;
@property (strong, nonatomic) NSString* trader_icon;
@property (assign, nonatomic) int trader_isAuth;
@property (strong, nonatomic) NSString* trader_account;
@property (strong, nonatomic) NSString* trader_university;
@property (assign, nonatomic) int trader_sex;
@property (assign, nonatomic) int good_comment;


@property (strong, nonatomic) NSArray* img;



+(HomeModel *)shareManger;

@end
