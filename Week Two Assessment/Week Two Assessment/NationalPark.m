//
//  NationalPark.m
//  Week Two Assessment
//
//  Created by Aaron B on 1/22/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "NationalPark.h"
#import "DetailsVC.h"

@implementation NationalPark

- (void) sendTitleToDelegate:(id)buttonSender {
    [self.delegate changeNavTitle:self :buttonSender];
}

@end
