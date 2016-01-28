//
//  FoodTableViewCell.m
//  Happy Lunch
//
//  Created by Aaron B on 1/20/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "FoodTableViewCell.h"

@implementation FoodTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onFoodItemTapped:(UIButton *)sender {
    [self.delegate foodTableViewCell:self didTapButton:sender];
}
@end
