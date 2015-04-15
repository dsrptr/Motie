//
//  ViewController.h
//  Motie
//
//  Created by MartinLi on 15-4-14.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIKeyboardViewController.h"
@interface LoginViewController : UIViewController<UIKeyboardViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *loginName;

@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)login:(id)sender;
- (IBAction)regist:(id)sender;
- (IBAction)passwordBack:(id)sender;

@end

