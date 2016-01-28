//
//  FilterSelectorView.h
//  Photo Filter
//
//  Created by Aaron B on 1/20/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCollectionViewCell.h"
@protocol FilterSelectorViewDelegate <NSObject>
@required

@optional
- (void)  passingCell :(NSInteger) indexPathRow :(UIButton *)button :(id)view;

@end

@interface FilterSelectorView : UIView
@property (nonatomic, assign) id <FilterSelectorViewDelegate> delegate;
@property NSInteger indexPathRow;
@end
