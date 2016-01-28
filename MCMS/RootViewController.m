//
//  RootViewController.m
//  MCMS
//
//  Created by Aaron B on 1/19/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "RootViewController.h"
#import "Magical Creature.h"
#import "MagicalCreatureViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property NSMutableArray *creatures;
@property NSMutableArray *accessories;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property UIBarButtonItem *addCreature;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.accessories = [[NSMutableArray alloc]initWithObjects:@"a purse", @"sandwhiches", @"a garbage can lid", @"candy", nil];
    
    Magical_Creature *magicalCreatureOne = [Magical_Creature new];
    magicalCreatureOne.name = @"zerlock";
    magicalCreatureOne.detail = @"likes pasta";
    magicalCreatureOne.accessory = self.accessories[0];
    
    Magical_Creature *magicalCreatureTwo = [Magical_Creature new];
    magicalCreatureTwo.name = @"Ferkborg";
    magicalCreatureTwo.detail = @"like pina coladas";
    magicalCreatureTwo.accessory = self.accessories[1];
    
    Magical_Creature *magicalCreatureThree = [Magical_Creature new];
    magicalCreatureThree.name = @"Binja Ninja";
    magicalCreatureThree.detail = @"is actually a trash can with a bandana";
    magicalCreatureThree.accessory = self.accessories[2];
    
    Magical_Creature *magicalCreatureFour = [Magical_Creature new];
    magicalCreatureFour.name = @"Snuffaluffagus";
    magicalCreatureFour.detail = @"gets creepily excited about children";
    magicalCreatureFour.accessory = self.accessories[3];
    
    self.creatures = [[NSMutableArray alloc] initWithObjects: magicalCreatureOne, magicalCreatureTwo, magicalCreatureThree, magicalCreatureFour, nil];
    
    
    UIBarButtonItem *addCreature = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCreatureToList)];
    
    self.addCreature = addCreature;
    self.navigationItem.leftBarButtonItem = addCreature;
    [self.tableView reloadData];
}

#pragma  Mark TableView Methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"magicalCreatureCell"];
    Magical_Creature *currentCreature = self.creatures[indexPath.row];
    cell.textLabel.text = currentCreature.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ and carries %@ wherever they go", currentCreature.detail, currentCreature.accessory];
    return cell;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
    
}

#pragma Mark Bar Button Items
- (void) addCreatureToList {
    Magical_Creature *newCreature = [Magical_Creature new];
    newCreature.name = self.textField.text;
    
    [self.creatures addObject:newCreature];
    self.textField.text = [NSString stringWithFormat:@""];
    [self.view endEditing:YES];
    [self.tableView reloadData];
}

#pragma Mark Segues
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MagicalCreatureViewController *destination = segue.destinationViewController;
    NSIndexPath *currentIndex = [self.tableView indexPathForSelectedRow];
    destination.currentCreatureIndexPath = currentIndex;
    destination.currentCreature = [self.creatures objectAtIndex:currentIndex.row];
}



- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}
@end
