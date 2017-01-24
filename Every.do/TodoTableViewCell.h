//
//  TodoTableViewCell.h
//  Every.do
//
//  Created by Alex Bearinger on 2017-01-24.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoObject.h"

@interface TodoTableViewCell : UITableViewCell <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *preview;
@property (weak, nonatomic) IBOutlet UILabel *priority;


@property bool isCompleted;

@end
