//
//  RedData.h
//  Motie
//
//  Created by macbook pro on 15/4/15.
//  Copyright (c) 2015年 Motie. All rights reserved.
//

#import "JSONModel.h"
@interface RedData_Info : JSONModel
@property(nonatomic,strong)NSString *content;
//@property(nonatomic,assign)NSInteger id;
@end
@interface RedData : JSONModel
@property(nonatomic,strong)RedData_Info *data;
@property(nonatomic,strong)NSString *error_msg;
@property(nonatomic,assign)NSInteger result;
@property(nonatomic,assign)NSInteger error_no;
@end
