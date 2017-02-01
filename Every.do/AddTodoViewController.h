//
//  AddTodoViewController.h
//  Every.do
//
//  Created by Alex Bearinger on 2017-01-24.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreManager.h"



@interface AddTodoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *todoTitle;
@property (weak, nonatomic) IBOutlet UILabel *priority;
@property (weak, nonatomic) IBOutlet UITextField *todoDescription;
@property (nonatomic) Todo *todo;
@property (nonatomic,copy) void (^addNewTodo)(Todo *todo);

@end
