//
//  RootViewController.m
//  Dragon Fashion
//
//  Created by Aaron B on 1/19/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "RootViewController.h"
#import "Dragon.h"


@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray *dragons;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Dragon *dragon = [[Dragon alloc] init];
    Dragon *dragon2 = [Dragon new];
    Dragon *dragon3 = [Dragon new];
    Dragon *dragon4 = [Dragon new];
    
    dragon.fullName = @"Smaug MoneyBags";
    dragon.clothingItem = @"I looove gOOOLD";
    
    dragon2.fullName = @"Rangorok";
    dragon2.clothingItem = @"atmospheric pressure";
    
    dragon3.fullName = @"Charmandor";
    dragon3.clothingItem = @"firey tail";
    
    dragon4.fullName = @"Falcor";
    dragon4.clothingItem = @"saddle";
    
    self.dragons = [NSArray arrayWithObjects:dragon, dragon2, dragon3, dragon4, nil];

    
    NSLog(@"%@", dragon.fullName);
}



#pragma  Mark  - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dragons.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RootViewCell"];
    Dragon *currentDragon = self.dragons[indexPath.row];
    cell.textLabel.text = currentDragon.fullName;
    cell.detailTextLabel.text = currentDragon.clothingItem;
    return cell;
}

#pragma  Mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *selectedCellIndexPath = [self.tableView indexPathForSelectedRow];
    UIViewController *destinationVC = segue.destinationViewController;
    
    destinationVC.title = [[self.dragons objectAtIndex:selectedCellIndexPath.row] description];
}

@end
