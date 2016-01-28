//
//  RootViewController.m
//  Photo Filter
//
//  Created by Aaron B on 1/20/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "RootViewController.h"
#import "CustomCollectionViewCell.h"
#import "FilterSelectorView.h"

@interface RootViewController () <UICollectionViewDataSource, UICollectionViewDelegate, FilterSelectorViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSMutableArray *imagesArray;
@property NSMutableArray *colorsArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imagesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"image1"], [UIImage imageNamed:@"image2"], [UIImage imageNamed:@"image3"], [UIImage imageNamed:@"image4"], nil];
    
    self.colorsArray = [[NSMutableArray alloc] initWithObjects:[UIColor colorWithRed:115/255.00 green:99/255.00 blue:84/255.00 alpha:1], [UIColor colorWithRed:54/255.00 green:72/255.00 blue:76/255.00 alpha:1], [UIColor colorWithRed:93/255.00 green:64/255.00 blue:84/255.00 alpha:1],[UIColor colorWithRed:153/255.00 green:91/255.00 blue:70/255.00 alpha:1], nil];
    self.collectionView.backgroundColor = [UIColor whiteColor];

}

-(void)passingCell:(NSInteger)indexPathRow :(UIButton *)button :(id)view {
    self.colorsArray[indexPathRow] = button.backgroundColor;
    [view removeFromSuperview];
    [self.collectionView reloadData];
}


# pragma  mark - UICollectionView Methods

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    cell.imageView.image = [self.imagesArray objectAtIndex:indexPath.row];
    cell.backgroundColor = [self.colorsArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imagesArray.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    FilterSelectorView *nibView = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil] objectAtIndex:0];
    nibView.delegate = self;
    nibView.backgroundColor = [UIColor whiteColor];
    nibView.alpha = .5;
    nibView.center = self.view.center;
    nibView.frame = self.view.frame;
    nibView.indexPathRow = indexPath.row;
    [self.view addSubview:nibView];
}
@end
