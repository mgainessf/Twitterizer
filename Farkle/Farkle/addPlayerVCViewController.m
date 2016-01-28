//
//  addPlayerVCViewController.m
//  Farkle
//
//  Created by Aaron B on 1/24/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "addPlayerVCViewController.h"
#import "Player.h"
#import "RootVC.h"
@interface addPlayerVCViewController () <UITableViewDataSource, UITableViewDelegate>
@property UIBarButtonItem *addPlayer;
@property NSMutableArray *players;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation addPlayerVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.players = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *addPlayer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayerToList)];
    
    self.addPlayer = addPlayer;
    self.navigationItem.leftBarButtonItem = addPlayer;
    [self.tableView reloadData];
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addPlayerCell"];
    Player *currentPlayer = self.players[indexPath.row];
    cell.textLabel.text = currentPlayer.name;
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.players.count;
}

- (void) addPlayerToList {
    Player *newPlayer = [Player new];
    newPlayer.name = self.textField.text;
    
    [self.players addObject:newPlayer];
    [self.view endEditing:YES];
    [self.tableView reloadData];
}
- (IBAction)playSeguePressed:(UIBarButtonItem *)sender {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    RootVC *destination = segue.destinationViewController;
    destination.playingPlayers = self.players;
}






@end
