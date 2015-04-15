//
//  Index0Service.m
//  Motie
//
//  Created by macbook pro on 15/4/15.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import "Index0Service.h"
#import "JSONModelLib.h"
#import "RedData.h"
@implementation Index0Service

-(void)oneBookDataWithToken:(NSString *)token andBookId:(NSString *)bookId andSd:(NSString *)sd withDone:(doneWithObject)done{
    [SVProgressHUD show];
//    NSString *book=@"41260_69776";
   
    NSString *urlString=@"http://www.motie.com/android/1/book/41260_69775";
//    NSLog(@"%@UrlString:%@",dict,urlString);
    
//    [RedData getModelFromURLWithString:urlString completion:^(RedData *model,JSONModelError *error){
//        NSLog(@"object:%@error:%@",model,error);
//    }];
     NSDictionary *dict=[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:token,nil ] forKeys:[NSArray arrayWithObjects:@"sd",nil]];
        NSLog(@"%@UrlString:%@",dict,urlString);
    [JSONHTTPClient postJSONFromURLWithString:urlString params:dict completion:^(id object, JSONModelError *error) {
//        NSString *error1 =[object objectForKey:@"error_msg"];
        NSNumber *error_no = (NSNumber*)[object objectForKey:@"error_no"];
        NSInteger status = [error_no integerValue];
        if (status==0) {
            [SVProgressHUD dismiss];
            done(object);
        }else{
//            [SVProgressHUD showErrorWithStatus:error1];
        }
        NSLog(@"object:%@error:%@",object,error);
    }];
//

}
@end
