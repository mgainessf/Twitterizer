//
//  NationalPark.h
//  Week Two Assessment
//
//  Created by Aaron B on 1/22/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol NationalParkDelegate <NSObject>
- (void) changeNavTitle:(id) nationalPark :(UIButton *) sender;
@end

@interface NationalPark : NSObject
@property NSString *parkName;
@property NSString *parkLocation;
@property UIImage *parkImage;
@property NSURL *wikiPage;
@property (nonatomic, assign) id <NationalParkDelegate> delegate;

- (void) sendTitleToDelegate :(id)buttonSender;

@end
