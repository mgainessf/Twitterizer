//
//  BlockPartyTableViewController.m
//  BlocParty
//
//  Created by Aaron B on 1/25/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "BlockPartyTableViewController.h"

@interface BlockPartyTableViewController ()
@property NSArray *data;

@end

@implementation BlockPartyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data =  [NSArray arrayWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"BlockPartyWords" ofType:@"plist"]];
        
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if (![userDefaults boolForKey:@"firstLaunch"]) {
        [userDefaults setBool:YES forKey:@"firstLaunch"];
        UIImageView *splash = [[UIImageView alloc] initWithFrame:self.view.frame];
        splash.image = [UIImage imageNamed:@"splashscreen@1x"];
        [self.parentViewController.view addSubview:splash];
    }
}


#pragma mark - Table view data source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.data.count;
}

#pragma mark - ShuffleButton


- (IBAction)onShuffleButtonTappedj:(UIBarButtonItem *)sender {
    [self shuffleData:[NSMutableArray arrayWithArray:self.data] compleHandy:^(NSArray *array) {
        self.data = array;
        [self.tableView reloadData];
    }];
}

- (void) shuffleData:(NSMutableArray *) input compleHandy:(void (^) (NSArray *array)) completionHandler {
    NSUInteger count = input.count;
    for (NSUInteger i = 0; i < count - 1; i++) {
        NSUInteger remainingCount = count - i;
        NSUInteger exchangeIndex = i + arc4random_uniform(remainingCount);
        [input exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    completionHandler([NSArray arrayWithArray:input]);
}


#pragma mark - SortButton
- (IBAction)onBubbleSortTapped:(UIBarButtonItem *)sender {
    sender.enabled = NO;
    [self bubbleSort:[NSMutableArray arrayWithArray:self.data] completionHandler:^(NSArray *array) {
        self.data = array;
        [self.tableView reloadData];
        sender.enabled = YES;
    }];
}


-(void)bubbleSort:(NSMutableArray *)input completionHandler:(void(^)(NSArray *array))completionHandler{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0),
                   ^{
                       BOOL isUnsorted = YES;
                       NSUInteger sortProgress = 0;
                       while(isUnsorted){
                           isUnsorted = NO;
                           for (NSInteger i = 0; i < input.count - 1 - sortProgress; i++) {
                               NSString *str1 = [input objectAtIndex:i];
                               NSString *str2 = [input objectAtIndex:i+1];
                               if([str1 compare:str2]>0){
                                   [input exchangeObjectAtIndex:i withObjectAtIndex:i+1];
                                   isUnsorted = YES;
                               }
                           }
                           sortProgress++;
                       }
                       dispatch_async(dispatch_get_main_queue(), ^{
                           completionHandler([NSArray arrayWithArray:input]);
                       });
                   });
}

@end
