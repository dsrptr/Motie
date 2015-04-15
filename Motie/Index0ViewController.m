//
//  Index0ViewController.m
//  Motie
//
//  Created by MartinLi on 15-4-15.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import "Index0ViewController.h"

@interface Index0ViewController ()

@end

@implementation Index0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ShareData *sharedData =[ShareData sharedInstance];
    NSLog(@"%@",sharedData.token);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
