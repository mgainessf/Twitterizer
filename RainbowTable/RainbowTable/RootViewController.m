//
//  RootViewController.m
//  RainbowTable
//
//  Created by Aaron B on 1/18/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property NSMutableArray *colorArray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorArray = [NSMutableArray new];
    self.colorArray = [NSMutableArray arrayWithObjects: [UIColor redColor], [UIColor whiteColor], [UIColor blueColor], nil];
}

# pragma mark - TableView Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell Identifier"];
    cell.textLabel.text = [NSString stringWithFormat:@"row %li", (long)indexPath.row];

    cell.backgroundColor = [self.colorArray objectAtIndex:indexPath.row];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colorArray.count;
}
@end
