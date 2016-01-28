//
//  DieLabel.m
//  Farkle
//
//  Created by Aaron B on 1/21/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "DieLabel.h"
#import "RootVC.h"

@interface DieLabel () <UIGestureRecognizerDelegate>

@end

@implementation DieLabel


- (instancetype) initWithCoder:(NSCoder *) aDecoder {
    self = [super initWithCoder:aDecoder]; //retain stock functionality
    
    if (self){
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:tap];
        tap.delegate = self;
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void) handleTap: (UITapGestureRecognizer *) gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"was Tapped");
        [self.delegate changeFrame:self];
    }
}


@end
