//
//  TravelersTableViewController.m
//  Travelers
//
//  Created by Aaron B on 1/26/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "TravelersTableViewController.h"
#import "AppDelegate.h"
#import "Traveler.h"

@interface TravelersTableViewController () <UITextFieldDelegate>

@property NSMutableArray *traveler;
@property NSManagedObjectContext *moc;

@end

@implementation TravelersTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self loadTravelersWithAge:@1];
    
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.traveler.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    Traveler *traveler = [self.traveler objectAtIndex:indexPath.row];
    
    cell.textLabel.text = traveler.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Age: %@ \n Budget:%@", traveler.age, traveler.budget];
    cell.detailTextLabel.numberOfLines = 0; // sets number of lines modularly
    return cell;
}

- (void) loadTravelersWithAge :(NSNumber *) age {
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Traveler"];
    NSSortDescriptor *sortByName = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSSortDescriptor *sortByBudget = [[NSSortDescriptor alloc] initWithKey:@"budget" ascending:YES];
    request.sortDescriptors = @[sortByBudget, sortByName];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age >= %@", age];
    
    request.predicate = predicate;
    NSError *error;
    
    self.traveler = [NSMutableArray arrayWithArray:[self.moc executeFetchRequest:request error:&error]];
    
    if (error == nil) {
        [self.tableView reloadData];
    }
    else {
        NSLog(@"An Error occured😳");
    }
}
//
//- (void) deleteTravelersAtIndexPath :(NSIndexPath *) indexPath {
//    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
//
//    
//    NSManagedObjectContext *context = [appDelegate managedObjectContext];
//    
//    [context deleteObject:[self.traveler objectAtIndex:indexPath.row]];
//}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    Traveler *traveler = [NSEntityDescription insertNewObjectForEntityForName:@"Traveler"inManagedObjectContext:self.moc];
    
    traveler.name = textField.text;
    
    traveler.age = [NSNumber numberWithInt:arc4random_uniform(100)];
    
    traveler.budget = [NSNumber numberWithInt:100 + arc4random_uniform(400)];
    
    NSError *error;
    
    if ([self.moc save:&error]) {
        [self loadTravelersWithAge:@1];
    }
    else {
        NSLog(@"An Error Occured🤓");
    }
    
    textField.text = nil;
    return [textField resignFirstResponder];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//         [self deleteTravelersAtIndexPath:indexPath];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//       
//    }
//}

@end
