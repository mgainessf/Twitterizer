//
//  RootViewController.m
//  Hall Of Fame
//
//  Created by Aaron B on 1/20/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "RootViewController.h"
#import "PictureCollectionViewCell.h"
#import "CustomView.h"

@interface RootViewController () <UICollectionViewDataSource, UICollectionViewDelegate, CustomViewDelegate>
@property NSArray *picturesArray;
@property NSMutableArray *colorsArray;
@property CGRect *frame;
@property NSIndexPath *currentIndexPath;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.picturesArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"image0"], [UIImage imageNamed:@"image1"], [UIImage imageNamed:@"image5"], [UIImage imageNamed:@"image3"], nil];
    
    self.colorsArray = [[NSMutableArray alloc] initWithObjects:[UIColor colorWithRed:115/255.00 green:99/255.00 blue:84/255.00 alpha:1], [UIColor colorWithRed:54/255.00 green:72/255.00 blue:76/255.00 alpha:1], [UIColor colorWithRed:93/255.00 green:64/255.00 blue:84/255.00 alpha:1],[UIColor colorWithRed:153/255.00 green:91/255.00 blue:70/255.00 alpha:1], nil];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

-(void) changeColor:(id)view :(UIButton *)sender {
    [view removeFromSuperview];
    [self.colorsArray replaceObjectAtIndex:self.currentIndexPath.row withObject:sender.backgroundColor];
    [self.collectionView reloadData];
}


-(void) returnToOriginalVC:(id)view :(UIButton *)sender{
    [view removeFromSuperview];
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomView *nibView = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil] objectAtIndex:0];
    nibView.delegate = self;
    [self.view addSubview:nibView];
    nibView.center = self.view.center;
    self.currentIndexPath = indexPath;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.picturesArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PictureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PictureCellID" forIndexPath:indexPath];
        cell.customImageView.image = [self.picturesArray objectAtIndex:indexPath.row];
        cell.backgroundColor = [self.colorsArray objectAtIndex:indexPath.row];
    return cell;
}

@end
