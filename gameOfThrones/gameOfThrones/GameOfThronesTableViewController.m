//
//  GameOfThronesTableViewController.m
//  gameOfThrones
//
//  Created by Aaron B on 1/26/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "GameOfThronesTableViewController.h"
#import "addGOTActorViewController.h"
#import "GOTActor.h"
#import "AppDelegate.h"
#import "GOTPerson.h"

@interface GameOfThronesTableViewController ()
@property NSMutableArray *gameOfthronesCharecters;
@property NSManagedObjectContext *moc;

@end

@implementation GameOfThronesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
    
    [self loadGOTPeople];
}


-(void) updateTableView {
    [self loadGOTPeople];
    NSLog(@"hit");
    [self.tableView reloadData];
}



#pragma mark - Core Data Methods

-(void) loadGOTPeople  {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"GOTPerson"];
    NSSortDescriptor *sortByActor = [[NSSortDescriptor alloc] initWithKey:@"actor" ascending:YES];
    NSSortDescriptor *sortByCharacter = [[NSSortDescriptor alloc] initWithKey:@"character" ascending:YES];
    request.sortDescriptors = @[sortByActor, sortByCharacter];
    
    NSError *error;
    
    [self.gameOfthronesCharecters removeAllObjects];
    self.gameOfthronesCharecters = [[NSMutableArray alloc] init];
    
    self.gameOfthronesCharecters = [NSMutableArray arrayWithArray:[self.moc executeFetchRequest:request error:&error]];
    
    if (self.gameOfthronesCharecters.count == 0) {
        NSArray *plistCharacters = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gameofthrones" ofType:@"plist"]];
        
        for (NSDictionary *dict in plistCharacters) {
            GOTActor *actor = [[GOTActor alloc] init];
            actor.actor = [dict objectForKey:@"actor"];
            actor.character = [dict objectForKey:@"character"];
        }
        
        if ([self.moc save:&error]) {
            [self.tableView reloadData];
        }
        
        else {
            NSLog(@"🤓Error");
        }
        
    }
 }



#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.gameOfthronesCharecters.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    GOTActor *gotActor = [[GOTActor alloc] init];
    for (NSDictionary *dict in self.gameOfthronesCharecters) {
        gotActor.actor = [dict objectForKey:@"actor"];
        gotActor.character = [dict objectForKey:@"character"];
    cell.textLabel.text = gotActor.actor;
    cell.detailTextLabel.text = gotActor.character;
    cell.detailTextLabel.numberOfLines = 0;
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    addGOTActorViewController* controller = [segue destinationViewController];
    controller.delegate = self;
}

@end
