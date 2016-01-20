//
//  Dragon.h
//  Dragon Fashion
//
//  Created by Aaron B on 1/19/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dragon : NSObject
@property NSString *fullName;
@property NSString *clothingItem;
-(instancetype) initWithFullName: (NSString *)fullName clothinItem:(NSString *)clothingItem;
@end
