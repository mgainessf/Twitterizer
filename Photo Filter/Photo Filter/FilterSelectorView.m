//
//  FilterSelectorView.m
//  Photo Filter
//
//  Created by Aaron B on 1/20/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "FilterSelectorView.h"

@implementation FilterSelectorView

- (IBAction)buttonWasTapped:(UIButton *)sender {
    [self.delegate passingCell:self.indexPathRow :sender :self];
    NSLog(@"%@", sender.backgroundColor);
}

@end
