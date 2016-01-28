//
//  GameOfThronesTableViewController.h
//  gameOfThrones
//
//  Created by Aaron B on 1/26/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GOTActor.h"

@protocol GotVCProtocol

- (void) updateTableView;

@end

@interface GameOfThronesTableViewController : UITableViewController <GotVCProtocol>
@property NSString *addNewActor;
@property NSString *addNewCharacter;



@end
