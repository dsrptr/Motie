//
//  RegistSecondViewController.h
//  Motie
//
//  Created by MartinLi on 15-4-14.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIKeyboardViewController.h"
@interface RegistSecondViewController : UIViewController
@property(nonatomic,strong)NSString *code;
@property(nonatomic,assign)NSInteger type;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *passwordCheck;
- (IBAction)regist:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonTitle;

@end
