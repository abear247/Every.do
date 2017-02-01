//
//  Todo+CoreDataProperties.m
//  Every.do
//
//  Created by Alex Bearinger on 2017-02-01.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Todo+CoreDataProperties.h"

@implementation Todo (CoreDataProperties)

+ (NSFetchRequest<Todo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Todo"];
}

@dynamic title;
@dynamic todoDescription;
@dynamic priority;
@dynamic isCompleted;

@end
