//
//  AddTodoViewController.m
//  Every.do
//
//  Created by Alex Bearinger on 2017-01-24.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "AddTodoViewController.h"


@interface AddTodoViewController ()


@end

@implementation AddTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)priorityStepper:(id)sender {
    self.priority.text = [NSString stringWithFormat:@"%f",[sender stepValue]];
}


- (IBAction)done:(id)sender {
    TodoObject *todo = [[TodoObject alloc] initWithTitle:self.todoTitle.text description:self.description priority:[self.priority.text intValue]];

    self.addNewTodo(todo);
    [self dismissViewControllerAnimated:YES
                             completion:nil];
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
