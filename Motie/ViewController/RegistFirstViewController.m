//
//  RegistFirstViewController.m
//  Motie
//
//  Created by MartinLi on 15-4-14.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import "RegistFirstViewController.h"
#import "RegistService.h"
#import "RegistSecondViewController.h"
@interface RegistFirstViewController ()
{
    RegistService *registService;
    ShareData *sharedData;
    NSInteger type;//这里是注册0是填写手机号码发送验证码1是填写验证码进行验证
    NSInteger buttonType;
}
@end

@implementation RegistFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.Type==1) {
        self.no.hidden=YES;
        self.motieCode.hidden=YES;
    }
    type=0;
    buttonType=0;
    registService =[RegistService new];
    [self.name becomeFirstResponder];
    self.name.keyboardType=UIKeyboardTypeNumberPad;
     sharedData= [ShareData sharedInstance];
    NSLog(@"%@",sharedData.device_id);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)getCode:(id)sender {
    if (type==0) {
        sharedData.loginname=self.name.text;
        [registService send_codeWithPhone:self.name.text  andDeviceld:sharedData.device_id inViewController:self andSendeType:self.Type andCode:self.name.text type:type withDone:^(id object){
            type=1;
            self.title1.textColor=[UIColor grayColor];
            self.title2.textColor=[UIColor blueColor];
            self.name.text=@"";
            [self.codeTitle setTitle:@"提交验证码" forState:UIControlStateNormal];
            NSString *error_msg = (NSString *)[object objectForKey:@"error_msg"];
            [SVProgressHUD showErrorWithStatus:error_msg];
        }];
    }else{
        [registService send_codeWithPhone:sharedData.loginname  andDeviceld:sharedData.device_id inViewController:self andSendeType:self.Type andCode:self.name.text type:type withDone:^(id object){
            UIStoryboard *storBoard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
            RegistSecondViewController *registSecondViewController=[storBoard instantiateViewControllerWithIdentifier:@"RegistSecondViewController"];
            registSecondViewController.type=self.Type;
            registSecondViewController.code=self.name.text;
            [self.navigationController pushViewController:registSecondViewController animated:YES];
        }];
    }
}
- (IBAction)yes:(id)sender {
    if (buttonType==0) {
        buttonType=1;
        [self.no setBackgroundImage:[UIImage imageNamed:@"yes"] forState:UIControlStateNormal];
    }else{
        buttonType=0;
        [self.no setBackgroundImage:[UIImage imageNamed:@"no"] forState:UIControlStateNormal];
    
    }
    
}
@end
