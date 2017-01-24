//
//  AddTodoViewController.h
//  Every.do
//
//  Created by Alex Bearinger on 2017-01-24.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoObject.h"



@interface AddTodoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *todoTitle;
@property (weak, nonatomic) IBOutlet UILabel *priority;
@property (weak, nonatomic) IBOutlet UITextField *todoDescription;
@property (nonatomic) TodoObject *todo;
@property (nonatomic,copy) void (^addNewTodo)(TodoObject *todo);

@end
