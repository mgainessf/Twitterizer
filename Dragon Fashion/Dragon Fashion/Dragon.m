//
//  Dragon.m
//  Dragon Fashion
//
//  Created by Aaron B on 1/19/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "Dragon.h"

@implementation Dragon

- (NSString *) description {
    return [NSString stringWithFormat:@"Dragon %@", self.fullName];
}

-(instancetype) initWithFullName: (NSString *)fullName clothinItem:(NSString *)clothingItem {
    self = [super init];
    self.fullName = fullName;
    self.clothingItem = clothingItem;
    return self;
}

@end
