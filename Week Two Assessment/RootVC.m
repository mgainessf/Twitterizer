//
//  RootVC.m
//  Week Two Assessment
//
//  Created by Aaron B on 1/22/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "RootVC.h"
#import "NationalPark.h"
#import "DetailsVC.h"

@interface RootVC () <UITableViewDataSource, UITableViewDelegate, NationalParkDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *parksArray;
@property NSArray *images;

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NationalPark *parkOne = [NationalPark new];
    parkOne.parkName = @"Arcadia National Park";
    parkOne.parkLocation = @"Maine";
    parkOne.parkImage = [UIImage imageNamed:@"image1"];
    parkOne.wikiPage = [NSURL URLWithString:@"https://en.wikipedia.org/wiki/Acadia_National_Park"];
    
    NationalPark *parkTwo = [NationalPark new];
    parkTwo.parkName = @"National Park of American Samoa";
    parkTwo.parkLocation = @"American Samoa";
    parkTwo.parkImage = [UIImage imageNamed:@"image2"];
    parkTwo.wikiPage = [NSURL URLWithString:@"https://en.wikipedia.org/wiki/National_Park_of_American_Samoa"];
    
    NationalPark *parkThree = [NationalPark new];
    parkThree.parkName = @"Arches National Park";
    parkThree.parkLocation = @"Utah";
    parkThree.parkImage = [UIImage imageNamed:@"image3"];
    parkThree.wikiPage = [NSURL URLWithString:@"https://en.wikipedia.org/wiki/Arches_National_Park"];
    
    NationalPark *parkFour = [NationalPark new];
    parkFour.parkName = @"Badlands National Park";
    parkFour.parkLocation = @"South Dakota";
    parkFour.parkImage = [UIImage imageNamed:@"image4"];
    parkFour.wikiPage = [NSURL URLWithString:@"https://en.wikipedia.org/wiki/Badlands_National_Park"];
    
    
    NationalPark *parkFive = [NationalPark new];
    parkFive.parkName = @"Big Bend National Park";
    parkFive.parkLocation = @"Texas";
    parkFive.parkImage = [UIImage imageNamed:@"image5"];
    parkFive.wikiPage = [NSURL URLWithString:@"https://en.wikipedia.org/wiki/Big_Bend_National_Park"];
    
    self.parksArray = [[NSMutableArray alloc] initWithObjects: parkOne, parkTwo, parkThree, parkFour, parkFive,  nil];
    
    [self.tableView reloadData];
    
}


#pragma  mark  - TableView Methods
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IDCell"];
    
    NationalPark *currentPark = [self.parksArray objectAtIndex:indexPath.row];
    cell.textLabel.text = currentPark.parkName;
    cell.detailTextLabel.text = currentPark.parkLocation;
    cell.imageView.image = currentPark.parkImage;
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.parksArray.count;
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.parksArray removeObjectAtIndex:indexPath.row];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma  mark - Segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailsVC *destination = segue.destinationViewController;
    NSIndexPath *selectedCell = [self.tableView indexPathForSelectedRow];
    destination.selectedPark = [self.parksArray objectAtIndex:selectedCell.row];
    destination.selectedIndexPath = selectedCell;
    destination.selectedPark.delegate = self;

}

- (void)changeNavTitle:(NationalPark *)nationalPark :(UIButton *)sender {
    self.title = nationalPark.parkName;
}
- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}



@end
