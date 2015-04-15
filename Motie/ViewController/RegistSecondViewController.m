//
//  RegistSecondViewController.m
//  Motie
//
//  Created by MartinLi on 15-4-14.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import "RegistSecondViewController.h"
#import "RegistService.h"
@interface RegistSecondViewController ()
{
    RegistService *registService;
    ShareData *sharedData;
//    UIKeyboardViewController *keyBoardController;
}
@end

@implementation RegistSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     registService =[RegistService new];
    sharedData= [ShareData sharedInstance];
    if (self.type==1) {
        [self.buttonTitle setTitle:@"重置密码" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)regist:(id)sender {
        if ([self.password.text isEqualToString:@""]||[self.passwordCheck.text isEqualToString:@""]) {
            [SVProgressHUD showErrorWithStatus:@"输入的密码或确认密码不能为空！"];
        }else if(self.password.text.length<6||self.password.text.length>32){
            [SVProgressHUD showErrorWithStatus:@"请输入正确的密码格式“6-32数字与字符组合！"];
        }else if(![self.password.text isEqualToString:self.passwordCheck.text]){
            [SVProgressHUD showErrorWithStatus:@"两次输入的密码不一致！"];
        }else{
            NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
            NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
            NSLog(@"timeSp:%@",timeSp); //时间戳的值
            [registService mobileRegistWithMobile:sharedData.loginname andName:[NSString stringWithFormat:@"mo%@",timeSp] andPassword:self.password.text andPasswordRepeat:self.passwordCheck.text andDeviceId:sharedData.device_id andCode:self.code inRegistSecondViewController:self andType:self.type withDone:^(id object){
                if (self.type==0) {
                    [SVProgressHUD showSuccessWithStatus:@"注册成功！"];
                }else{
                    [SVProgressHUD showSuccessWithStatus:@"密码修改成功！"];
                }
                [self.navigationController popToRootViewControllerAnimated:YES];
            }];
    }
}
@end
