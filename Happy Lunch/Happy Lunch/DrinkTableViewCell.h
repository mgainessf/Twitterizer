//
//  DrinkTableViewCell.h
//  Happy Lunch
//
//  Created by Aaron B on 1/20/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DrinkTableViewCellDelegate <NSObject>

@required

@optional

- (void) drinkTableViewCell:(id)cell
               didTapButton:(UIButton *)button;

@end

@interface DrinkTableViewCell : UITableViewCell

@property (nonatomic, assign) id <DrinkTableViewCellDelegate> delegate;

@end
