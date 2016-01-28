//
//  PictureCollectionViewCell.h
//  Hall Of Fame
//
//  Created by Aaron B on 1/20/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureCollectionViewCell : UICollectionViewCell
@property UIImage *image;
@property UIColor *frameColor;
@property (weak, nonatomic) IBOutlet UIImageView *customImageView;

@end
