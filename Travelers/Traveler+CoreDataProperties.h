//
//  Traveler+CoreDataProperties.h
//  Travelers
//
//  Created by Aaron B on 1/26/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Traveler.h"

NS_ASSUME_NONNULL_BEGIN

@interface Traveler (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *budget;
@property (nullable, nonatomic, retain) NSNumber *age;

@end

NS_ASSUME_NONNULL_END
