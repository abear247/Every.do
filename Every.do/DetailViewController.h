//
//  DetailViewController.h
//  Every.do
//
//  Created by Alex Bearinger on 2017-01-24.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoObject.h"
@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *priority;
@property (weak, nonatomic) IBOutlet UILabel *todoDescription;
@property (nonatomic) TodoObject *todo;
@property (nonatomic) NSString *priorityText;
@property (nonatomic) NSString *todoText;

@end

