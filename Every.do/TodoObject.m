//
//  TodoObject.m
//  Every.do
//
//  Created by Alex Bearinger on 2017-01-24.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "TodoObject.h"

@implementation TodoObject
-(instancetype)initWithTitle:(NSString *)title description:(NSString *)description priority:(int)priority{
    self = [super init];
    if (self){
        self.title = title;
        self.todoDescription = description;
        self.priorityNumber = priority;
        self.isCompleted = NO;
    }
    return self;
}
@end
