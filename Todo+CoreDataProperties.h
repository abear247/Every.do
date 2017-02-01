//
//  Todo+CoreDataProperties.h
//  Every.do
//
//  Created by Alex Bearinger on 2017-02-01.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Todo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Todo (CoreDataProperties)

+ (NSFetchRequest<Todo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *todoDescription;
@property (nonatomic) int16_t priority;
@property (nonatomic) BOOL isCompleted;

@end

NS_ASSUME_NONNULL_END
