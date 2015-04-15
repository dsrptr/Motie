//
//  LoginService.h
//  Motie
//
//  Created by MartinLi on 15-4-14.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"
@interface LoginService : NSObject
-(void)loginWith:(NSString *)loginName andPassword:(NSString *)password andDevice_id:(NSString *)device_id inLoginViewController:(LoginViewController*)viewController withDone:(doneWithObject)done;
@end
