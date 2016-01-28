//
//  RootViewController.m
//  Happy Lunch
//
//  Created by Aaron B on 1/20/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "RootViewController.h"
#import "FoodTableViewCell.h"

@interface RootViewController () <UITableViewDelegate, UITableViewDataSource, FoodTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *drinkImageView;
@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
    
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FoodCell"];
    cell.delegate = self;
    return cell;
}

- (void) foodTableViewCell:(id)cell didTapButton:(UIButton *)button {
    self.foodImageView.image = button.imageView.image;
}
@end
