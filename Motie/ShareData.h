//
//  ShareData.h
//  Motie
//
//  Created by MartinLi on 15-4-14.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareData : NSObject
@property(nonatomic,strong)NSString *loginname;
@property(nonatomic,strong)NSString *password;
@property(nonatomic,strong)NSString *device_id;
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *score;
@property(nonatomic,strong)NSString *token;
@property(nonatomic,strong)NSString *userid;
@property(nonatomic,strong)NSString *level;
@property(nonatomic,strong)NSString *name;
+(id)sharedInstance;
@end
