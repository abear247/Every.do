//
//  TodoObject.h
//  Every.do
//
//  Created by Alex Bearinger on 2017-01-24.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoObject : NSObject 

@property NSString *title;
@property (nonatomic,readwrite) NSString *todoDescription;
@property int priorityNumber;
@property bool isCompleted;

-(instancetype)initWithTitle:(NSString *)title description:(NSString *)description priority:(int)priority;

@end
