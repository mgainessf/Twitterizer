//
//  GOTPerson+CoreDataProperties.h
//  gameOfThrones
//
//  Created by Aaron B on 1/26/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "GOTPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface GOTPerson (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *actor;
@property (nullable, nonatomic, retain) NSString *character;

@end

NS_ASSUME_NONNULL_END
