//
//  CoreManager.h
//  Every.do
//
//  Created by Alex Bearinger on 2017-02-01.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Todo+CoreDataProperties.h"
//@class Todo;

@interface CoreManager : NSObject <NSFetchedResultsControllerDelegate>
@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (strong, nonatomic) NSFetchedResultsController<Todo *> *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
+(id)coreManager;
@end
