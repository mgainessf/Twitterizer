//
//  CustomCollectionViewCell.h
//  Photo Filter
//
//  Created by Aaron B on 1/20/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell
@property UIImage *cellImage;
@property UIColor *cellColor;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
