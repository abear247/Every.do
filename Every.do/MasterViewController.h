//
//  MasterViewController.h
//  Every.do
//
//  Created by Alex Bearinger on 2017-01-24.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoObject.h"
#import "TodoTableViewCell.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property NSArray<TodoObject *>*todos;

@end

