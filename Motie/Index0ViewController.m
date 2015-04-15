//
//  Index0ViewController.m
//  Motie
//
//  Created by MartinLi on 15-4-15.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import "Index0ViewController.h"
#import "Index0Service.h"
@interface Index0ViewController ()
{
    NSString *search;
    NSString *replace;
    NSRange substr2;
}
@end

@implementation Index0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    search=@"<br/>";
    replace=@"\n   ";
    
    ShareData *sharedData =[ShareData sharedInstance];
    NSLog(@"%@",sharedData.token);
    Index0Service *index0Service =[Index0Service new];
    [index0Service oneBookDataWithToken:sharedData.token andBookId:@"" andSd:@"" withDone:^(id object){
        NSDictionary *data =[object objectForKey:@"data"];
        NSMutableAttributedString *content =[[NSMutableAttributedString alloc]initWithString:[data objectForKey:@"content"]];
        NSString *str =[data objectForKey:@"content"];
       
        substr2= [str rangeOfString:search];
        while (substr2.location !=  NSNotFound) {
            [content replaceCharactersInRange:substr2 withString:replace];
            
            substr2 =[[NSString stringWithFormat:@"%@",content] rangeOfString:search];
            NSLog(@"%@",content);
        }
        NSLog(@"－－－－－－%@",content);
        self.conten.text=[NSString stringWithFormat:@"   %@",content];
    }];
    
    
    
    
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
