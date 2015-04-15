//
//  ViewController.m
//  Motie
//
//  Created by MartinLi on 15-4-14.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistFirstViewController.h"
#import "Index0ViewController.h"
#import "LoginService.h"
@interface LoginViewController ()
{
    LoginService *loginService;
    ShareData *sharedData;
    UIKeyboardViewController *keyBoardController;
    
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
  
    loginService =[LoginService new];
    sharedData =[ShareData sharedInstance];
    keyBoardController = [[UIKeyboardViewController alloc] initWithControllerDelegate:self];
    [keyBoardController addToolbarToKeyboard];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)login:(id)sender {
    NSString *loginName =self.loginName.text;
    NSString *password=self.password.text;
    if (loginName.length<1||password.length<1) {
        [SVProgressHUD showErrorWithStatus:@"账号或密码不能为空!"];
    }else{
        [loginService loginWith:loginName andPassword:password andDevice_id:sharedData.device_id inLoginViewController:self withDone:^(id object){
            NSLog(@"%@",object);
            NSDictionary *dict =[object objectForKey:@"data"];
            sharedData.icon=[dict objectForKey:@"dict"];
            sharedData.name=[dict objectForKey:@"name"];
            sharedData.score=[dict objectForKey:@"score"];
            sharedData.token=[dict objectForKey:@"token"];
            sharedData.userid=[dict objectForKey:@"id"];
            sharedData.level=[dict objectForKey:@"level"];
            UIStoryboard *storBoard =[UIStoryboard storyboardWithName:@"Index0" bundle:nil];
            Index0ViewController *index0ViewController=[storBoard instantiateViewControllerWithIdentifier:@"Index0ViewController"];
            [self.navigationController pushViewController:index0ViewController animated:YES];
        }];
    }
   }

- (IBAction)regist:(id)sender {
    UIStoryboard *storBoard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RegistFirstViewController *registFirst=[storBoard instantiateViewControllerWithIdentifier:@"RegistFirstViewController"];
    registFirst.Type=0;
    [self.navigationController pushViewController:registFirst animated:YES];
}

- (IBAction)passwordBack:(id)sender {
    UIStoryboard *storBoard =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RegistFirstViewController *registFirst=[storBoard instantiateViewControllerWithIdentifier:@"RegistFirstViewController"];
    registFirst.Type=1;
    [self.navigationController pushViewController:registFirst animated:YES];
    
}
@end
