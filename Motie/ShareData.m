//
//  ShareData.m
//  Motie
//
//  Created by MartinLi on 15-4-14.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import "ShareData.h"

@implementation ShareData
+(ShareData *)sharedInstance{
    static ShareData *sharedUser = nil;
    static dispatch_once_t once;
    dispatch_once(&once,^{
        sharedUser = [[ShareData alloc] init];
    });
    return sharedUser;
}
-(void)setDevice_id:(NSString *)device_id{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:device_id forKey:@"device_id"];
    [userDefaults synchronize];
}

-(NSString *)device_id{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"device_id"];
}

-(void)setLoginname:(NSString *)loginname{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:loginname forKey:@"loginname"];
    [userDefaults synchronize];
}

-(NSString *)loginname{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"loginname"];
}

-(void)setPassword:(NSString *)password{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:password forKey:@"password"];
    [userDefaults synchronize];
}

-(NSString *)password{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"password"];
}
-(void)setIcon:(NSString *)icon{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:icon forKey:@"icon"];
    [userDefaults synchronize];
}

-(NSString *)icon{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"icon"];
}
-(void)setScore:(NSString *)score{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:score forKey:@"score"];
    [userDefaults synchronize];
}

-(NSString *)score{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"score"];
}
-(void)setName:(NSString *)name{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:name forKey:@"name"];
    [userDefaults synchronize];
}

-(NSString *)name{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"name"];
}
-(void)setToken:(NSString *)token{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:token forKey:@"token"];
    [userDefaults synchronize];
}

-(NSString *)token{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"token"];
}
-(void)setLevel:(NSString *)level{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:level forKey:@"level"];
    [userDefaults synchronize];
}

-(NSString *)level{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"level"];
}
-(void)setUserid:(NSString *)userid{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:userid forKey:@"userid"];
    [userDefaults synchronize];
}

-(NSString *)userid{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"userid"];
}
@end
