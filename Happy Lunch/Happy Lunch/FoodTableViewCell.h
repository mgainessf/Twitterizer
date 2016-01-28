//
//  FoodTableViewCell.h
//  Happy Lunch
//
//  Created by Aaron B on 1/20/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FoodTableViewCellDelegate <NSObject>

@required

@optional
-(void) foodTableViewCell: (id)cell
             didTapButton: (UIButton *)button;

@end

@interface FoodTableViewCell : UITableViewCell

@property (nonatomic, assign) id <FoodTableViewCellDelegate> delegate;

@end
