//
//  RegistFirstViewController.h
//  Motie
//
//  Created by MartinLi on 15-4-14.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistFirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (nonatomic,assign)NSInteger Type;//注册和重置密码用一个
- (IBAction)getCode:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *codeTitle;
@property (weak, nonatomic) IBOutlet UILabel *title1;
@property (weak, nonatomic) IBOutlet UILabel *title2;

@property (weak, nonatomic) IBOutlet UILabel *motieCode;
@property (weak, nonatomic) IBOutlet UIButton *no;
- (IBAction)yes:(id)sender;
@end
