//
//  CustomView.h
//  Hall Of Fame
//
//  Created by Aaron B on 1/20/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomViewDelegate <NSObject>
- (void) changeColor :(id) view :(UIButton *) sender;
- (void) returnToOriginalVC :(id) view :(UIButton *) sender;

@end

@interface CustomView : UIView
@property (nonatomic, assign) id <CustomViewDelegate> delegate; 


@end
