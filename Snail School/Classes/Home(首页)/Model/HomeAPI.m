//
//  HomeAPI.m
//  Snail School
//
//  Created by 远深 on 15/12/2.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "HomeAPI.h"

@implementation HomeAPI
+(void)homeDataWithUrl:(NSString *)urlString
       success:(void(^)(id homeData))success
               fail:(void (^)())fail
{
    
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
     manger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manger GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *json = [HomeModel arrayOfModelsFromDictionaries:responseObject error:nil];
        if (success) {
            success(json);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"获取信息失败，请稍后再试" message:nil delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
        [alert show];
    }];
    
}
+(void)huatiDataWithUrl:(NSString *)urlString
                success:(void(^)(id homeData))success
                   fail:(void(^)())fail
{
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manger GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *json = [huaTiJsonModel arrayOfModelsFromDictionaries:responseObject error:nil];
        if (success) {
            success(json);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"获取信息失败，请稍后再试" message:nil delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
        [alert show];
    }];

}
+(void)homeDataWithUrl:(NSString *)urlString
                 Image:(UIImage *)image
                button:(UIButton *)button

{
    NSURL *url = [NSURL URLWithString:urlString];
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            [button setImage:img forState:UIControlStateNormal];
        });
        
    });
}
+(UIImage *)imageWithJsonString:(NSString *)jsonString
{
    NSString *str1 = @"http://139.196.33.40/";
    NSString *str = [NSString stringWithFormat:@"%@%@",str1,jsonString];
    NSURL *url  = [NSURL URLWithString:str];
    
    
    NSData *resultData = [NSData dataWithContentsOfURL:url];
    UIImage *img = [UIImage imageWithData:resultData];
    return img;
}
@end
