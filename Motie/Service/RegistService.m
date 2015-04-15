//
//  RegistService.m
//  Motie
//
//  Created by MartinLi on 15-4-14.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import "RegistService.h"
#import "JSONModelLib.h"
@implementation RegistService
//获取验证码
-(void)send_codeWithPhone:(NSString *)phone andDeviceld:(NSString *)device_id inViewController:(RegistFirstViewController *)viewController andSendeType:(NSInteger )senderType andCode:(NSString *)code type:(NSInteger)type withDone:(doneWithObject)done{
    if (type==0) {
        NSString *urlString;
        if (senderType==0) {
             urlString=Send_Code_URL;
        }else{
            urlString=Mobile_Forget_Send_Code_URL;

        }
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:phone,device_id,nil] forKeys:[NSArray arrayWithObjects:@"mobile",@"deviceId",nil]];
        NSLog(@"%@urlString:%@",dict,urlString);
        [SVProgressHUD show];
        [JSONHTTPClient postJSONFromURLWithString:urlString params:dict completion:^(id object, JSONModelError *error) {
             NSString *error1 =[object objectForKey:@"error_msg"];
            NSNumber *error_no = (NSNumber*)[object objectForKey:@"error_no"];
            NSInteger status = [error_no integerValue];
            if (status==704) {
                [SVProgressHUD dismiss];
                done(object);
            }else{
             [SVProgressHUD showErrorWithStatus:error1];
            }
            NSLog(@"object:%@error:%@",object,error);
        }];
    }else{
        //验证验证码
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:phone,code,nil] forKeys:[NSArray arrayWithObjects:@"mobile",@"code",nil]];
        NSString *urlString =Check_Code_URL;
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
}
//注册和重置密码 0 注册 1 重置密码
-(void)mobileRegistWithMobile:(NSString *)mobile andName:(NSString *)name andPassword:(NSString *)password andPasswordRepeat:(NSString *)passwordRepeat andDeviceId:(NSString *)deviceId andCode:(NSString *)code inRegistSecondViewController:(RegistSecondViewController*)viewController andType:(NSInteger)type withDone:(doneWithObject)done{
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:mobile,name,password,passwordRepeat,deviceId,code,nil] forKeys:[NSArray arrayWithObjects:@"mobile",@"name",@"password",@"passwordRepeat",@"deviceId",@"code",nil]];
    [SVProgressHUD show];
    NSString *urlString;
    if (type==0) {
          urlString =Mobile_Register_URL;
    }else{
        urlString =Resetpwd_URL;
    }
    [JSONHTTPClient postJSONFromURLWithString:urlString params:dict completion:^(id object, JSONModelError *error) {
        NSLog(@"object:%@error:%@",object,error);
         NSString *error1 =[object objectForKey:@"error_msg"];
        NSNumber *error_no = (NSNumber*)[object objectForKey:@"error_no"];
        NSInteger status = [error_no integerValue];
        if (status==0) {
            [SVProgressHUD dismiss];
            done(object);
        }
        [SVProgressHUD showErrorWithStatus:error1];
    }];

}
@end
