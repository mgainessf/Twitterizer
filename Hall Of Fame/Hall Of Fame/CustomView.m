//
//  CustomView.m
//  Hall Of Fame
//
//  Created by Aaron B on 1/20/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (IBAction)onButtonTapped:(UIButton *)sender {
    [self.delegate changeColor:self :sender];
}

- (IBAction)doneButtonTapped:(UIButton *)sender {
    [self.delegate returnToOriginalVC:self :sender];
}

@end
