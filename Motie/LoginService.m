//
//  LoginService.m
//  Motie
//
//  Created by MartinLi on 15-4-14.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import "LoginService.h"
#import "LoginModel.h"
#import "JSONModelLib.h"
@implementation LoginService
-(void)loginWith:(NSString *)loginName andPassword:(NSString *)password andDevice_id:(NSString *)device_id inLoginViewController:(LoginViewController*)viewController withDone:(doneWithObject)done{
    NSString *urlString =Login_URL;
    NSDictionary *dict =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:loginName,password,device_id,nil] forKeys:[NSArray arrayWithObjects:@"email",@"password",@"deviceId",nil]];
//    NSDictionary *dict =[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"13517493217",@"123456",@"11112222",nil] forKeys:[NSArray arrayWithObjects:@"email",@"password",@"deviceId",nil]];
    NSLog(@"%@urlString:%@",dict,urlString);
    [JSONHTTPClient postJSONFromURLWithString:urlString params:dict completion:^(id object, JSONModelError *error) {
        
         NSLog(@"object:%@error:%@",object,error);
        NSString *error1 =[object objectForKey:@"error_msg"];
        NSNumber *error_no = (NSNumber*)[object objectForKey:@"error_no"];
        NSInteger status = [error_no integerValue];
        if (status==0) {
            [SVProgressHUD dismiss];
            done(object);
        }else{
            [SVProgressHUD showErrorWithStatus:error1];
        }
    }];

}
@end
