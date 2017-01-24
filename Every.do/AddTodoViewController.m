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
    self.todoTitle.text = @"todo5";
    self.todoDescription.text = @"new";
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)priorityStepper:(UIStepper *)sender {
    int x = sender.value;
    self.priority.text = [NSString stringWithFormat:@"%d",x];
}


- (IBAction)done:(id)sender {
      NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:self.todoTitle.attributedText];
    TodoObject *todo = [[TodoObject alloc] initWithTitle:string description:self.todoDescription.text priority:[self.priority.text intValue]];
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
