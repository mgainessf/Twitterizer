//
//  DieLabel.h
//  Farkle
//
//  Created by Aaron B on 1/21/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootVC.h"
@protocol DieLabelDelegate <NSObject>
@required

@optional

- (void) changeFrame :(id) label ;
@end

@interface DieLabel : UILabel
@property NSString *identifier;
@property (nonatomic, assign) id <DieLabelDelegate> delegate;
@end
