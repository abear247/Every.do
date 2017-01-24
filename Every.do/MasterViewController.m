//
//  MasterViewController.m
//  Every.do
//
//  Created by Alex Bearinger on 2017-01-24.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    self.todos = [NSMutableArray new];
    TodoObject *todo1 = [[TodoObject alloc] initWithTitle:@"todo1" description:@"wake up" priority:1];
    TodoObject *todo2 = [[TodoObject alloc] initWithTitle:@"todo2" description:@"shower" priority:2];
    TodoObject *todo3 = [[TodoObject alloc] initWithTitle:@"todo3" description:@"eat breakfast" priority:3];
    TodoObject *todo4 = [[TodoObject alloc] initWithTitle:@"todo4" description:@"goto work" priority:4];
    [self.todos addObject:todo1];
    [self.todos addObject:todo2];
    [self.todos addObject:todo3];
    [self.todos addObject:todo4];
}


- (void)viewWillAppear:(BOOL)animated {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TodoObject *todo = self.todos[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        controller.title = todo.title;
        controller.priorityText = [NSString stringWithFormat:@"%d",todo.priorityNumber];
        controller.todoText = todo.todoDescription;
        [controller setDetailItem:todo];
    }
    if ([[segue identifier] isEqualToString:@"showAddTodo"]) {
        AddTodoViewController *controller = (AddTodoViewController *) [segue destinationViewController];
        controller.addNewTodo = self.callback;
     //   [self.todos addObject:todo];
        
        
    }
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoTableViewCell *cell = (TodoTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    TodoObject *todo = self.todos[indexPath.row];
    [cell.title setText:todo.title];
    [cell.preview setText:todo.todoDescription];
    [cell.priority setText:[NSString stringWithFormat:@"%d",todo.priorityNumber]];
    
    
    return cell;
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
