//
//  RegistService.h
//  Motie
//
//  Created by MartinLi on 15-4-14.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegistFirstViewController.h"
#import "RegistSecondViewController.h"
@interface RegistService : NSObject
-(void)send_codeWithPhone:(NSString *)phone andDeviceld:(NSString *)device_id inViewController:(RegistFirstViewController *)viewController andSendeType:(NSInteger )senderType andCode:(NSString *)code type:(NSInteger)type withDone:(doneWithObject)done;
-(void)mobileRegistWithMobile:(NSString *)mobile andName:(NSString *)name andPassword:(NSString *)password andPasswordRepeat:(NSString *)passwordRepeat andDeviceId:(NSString *)deviceId andCode:(NSString *)code inRegistSecondViewController:(RegistSecondViewController*)viewController andType:(NSInteger)type withDone:(doneWithObject)done;
@end
