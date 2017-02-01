//
//  MasterViewController.m
//  Every.do
//
//  Created by Alex Bearinger on 2017-01-24.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Todo+CoreDataProperties.h"
#import "CoreManager.h"

@interface MasterViewController ()
@property CoreManager *manager;
@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    self.manager = [CoreManager coreManager];
    self.todos = [NSMutableArray new];
//    NSMutableAttributedString * string1 = [[NSMutableAttributedString alloc] initWithString:@"todo1"];
//    NSMutableAttributedString * string2 = [[NSMutableAttributedString alloc] initWithString:@"todo2"];
//    NSMutableAttributedString * string3 = [[NSMutableAttributedString alloc] initWithString:@"todo3"];
//    NSMutableAttributedString * string4 = [[NSMutableAttributedString alloc] initWithString:@"todo4"];
//    TodoObject *todo1 = [[TodoObject alloc] initWithTitle:string1 description:@"wake up" priority:1];
//    TodoObject *todo2 = [[TodoObject alloc] initWithTitle:string2 description:@"shower" priority:2];
//    TodoObject *todo3 = [[TodoObject alloc] initWithTitle:string3 description:@"eat breakfast" priority:3];
//    TodoObject *todo4 = [[TodoObject alloc] initWithTitle:string4 description:@"goto work" priority:4];
//    [self.todos addObject:todo1];
//    [self.todos addObject:todo2];
//    [self.todos addObject:todo3];
//    [self.todos addObject:todo4];
    UISwipeGestureRecognizer *swiper = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(strikeOut:)];
    [self.tableView addGestureRecognizer:swiper];
}
//- (IBAction)crossOffLine:(id)sender {
//    TodoObject *todo = sender;
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:todo.title];
//    [string addAttribute:NSStrikethroughStyleAttributeName value:@1 range:NSMakeRange(0, string.length)];
//    todo.title = string;
//    
//}

-(void)strikeOut:(UISwipeGestureRecognizer *)sender{
    CGPoint swipe = [sender locationInView:self.tableView];
    TodoObject *todo = self.todos[0];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithAttributedString:todo.title];
    [string addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, string.length)];
    todo.title = string;
    [self.tableView reloadData];
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
        controller.title = todo.title.string;
        controller.priorityText = [NSString stringWithFormat:@"%d",todo.priorityNumber];
        controller.todoText = todo.todoDescription;
        [controller setDetailItem:todo];
    }
    if ([[segue identifier] isEqualToString:@"showAddTodo"]) {
        AddTodoViewController *controller = (AddTodoViewController *) [segue destinationViewController];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Todo" inManagedObjectContext:self.manager.persistentContainer.viewContext];
        Todo *todo = [[Todo alloc] initWithEntity:entity insertIntoManagedObjectContext:self.manager.persistentContainer.viewContext];
        controller.todo = todo;
        controller.addNewTodo = ^(Todo* todo){
     //       [self.todos addObject:todo];
            [self.tableView reloadData];
        };
       
        
        
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
    
    cell.title.attributedText = todo.title;
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
