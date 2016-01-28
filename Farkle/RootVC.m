//
//  RootVC.m
//  Farkle
//
//  Created by Aaron B on 1/21/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "RootVC.h"
#import "DieLabel.h"
#import "Player.h"

@interface RootVC () <UIAlertViewDelegate, DieLabelDelegate>
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *DieLabelCollection;
@property (weak, nonatomic) IBOutlet UILabel *SumLabel;
@property (strong, nonatomic) IBOutletCollection(DieLabel) NSArray *winDieLabelCollection;
@property (weak, nonatomic) IBOutlet UIButton *diceRollButton;
@property (weak, nonatomic) IBOutlet UIButton *RackEm;
@property (weak, nonatomic) IBOutlet UIButton *Stay;
@property NSUInteger numberOfPlayers;
@property NSNumber* randomNumber;

@property NSMutableArray *collectionOfDie;
@property NSMutableArray *tempDieRollArray;
@property NSMutableArray *selectedDie;
@property int currentPlayer;

@property NSNumber *turnsSum;
@property NSNumber *NetSum;
@property BOOL didFarkle;

@property NSMutableArray *WinSpots;
@property BOOL winSpotTakenOne;
@property BOOL winSpotTakenTwo;
@property BOOL winSpotTakenThree;
@property BOOL winSpotTakenFour;
@property BOOL winSpotTakenFive;
@property BOOL winSpotTakenSix;
@end

@implementation RootVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedDie = [[NSMutableArray alloc] init];
    self.RackEm.hidden = YES;
    self.Stay.hidden = YES;
    for (Player *player in self.playingPlayers) {
        NSLog(@"%@", player.name);
    }
    self.numberOfPlayers = self.playingPlayers.count;
    Player *playerOne = [self.playingPlayers objectAtIndex:0];
    self.navigationItem.title = [NSString stringWithFormat:@"%@'s turn", playerOne.name];
    self.currentPlayer = 0;
    
    
    self.winSpotTakenOne = NO;
    self.winSpotTakenTwo = NO;
    self.winSpotTakenThree = NO;
    self.winSpotTakenFour = NO;
    self.winSpotTakenFive = NO;
    self.winSpotTakenSix = NO;
    
    for (DieLabel *die in self.DieLabelCollection) {
        die.delegate = self;
    }
    
    DieLabel *dieOne = [self.DieLabelCollection objectAtIndex:0];
    dieOne.identifier = @"1";
    DieLabel *dieTwo = [self.DieLabelCollection objectAtIndex:1];
    dieTwo.identifier = @"2";
    DieLabel *dieThree = [self.DieLabelCollection objectAtIndex:2];
    dieThree.identifier = @"3";
    DieLabel *dieFour = [self.DieLabelCollection objectAtIndex:3];
    dieFour.identifier = @"4";
    DieLabel *dieFive = [self.DieLabelCollection objectAtIndex:4];
    dieFive.identifier = @"5";
    DieLabel *dieSix = [self.DieLabelCollection objectAtIndex:5];
    dieSix.identifier = @"6";
    self.collectionOfDie = [[NSMutableArray alloc] initWithObjects:dieOne, dieTwo, dieThree, dieFour, dieFive, dieSix, nil];
    
}


- (IBAction)RollDice:(UIButton *)sender {
    self.Stay.hidden = YES;
    self.didFarkle = YES;
    self.diceRollButton.hidden = YES;
    self.tempDieRollArray = [[NSMutableArray alloc] init];
    
    
    for (DieLabel *die in self.collectionOfDie) {
        NSLog(@"hit");
        die.userInteractionEnabled = NO;
        die.textColor = [UIColor blackColor];
        
        NSNumber *rand = [self generateRandomNumber];
        die.text = [NSString stringWithFormat:@"%@", rand];
        [self.tempDieRollArray addObject:rand];
        die.hidden = NO;
        die.userInteractionEnabled = YES;
        
        
    }
    
    //clear temp Dict and Arrays
    [self.tempDieRollArray removeAllObjects];
    self.tempDieRollArray = [[NSMutableArray alloc] init];
    

    self.RackEm.hidden = NO;
}





- (NSNumber *) generateRandomNumber {
    UInt32 rand = arc4random_uniform(6) + 1;
    NSNumber *randNSN = [NSNumber numberWithInt:rand];
    return randNSN;
}


- (void) changeFrame :(DieLabel *) label {
        DieLabel *winDieOne = [self.winDieLabelCollection objectAtIndex:0];
        CGRect winDieOneFrame = winDieOne.frame;
        DieLabel *winDieTwo = [self.winDieLabelCollection objectAtIndex:1];
        CGRect winDieTwoFrame = winDieTwo.frame;
        DieLabel *winDieThree= [self.winDieLabelCollection objectAtIndex:2];
        CGRect winDieThreeFrame = winDieThree.frame;
        DieLabel *winDieFour = [self.winDieLabelCollection objectAtIndex:3];
        CGRect winDieFourFrame = winDieFour.frame;
        DieLabel *winDieFive = [self.winDieLabelCollection objectAtIndex:4];
        CGRect winDieFiveFrame = winDieFive.frame;
        DieLabel *winDieSix = [self.winDieLabelCollection objectAtIndex:5];
        CGRect winDieSixFrame = winDieSix.frame;
    
    [self.selectedDie addObject:label.text];

    [self.collectionOfDie removeObject:label];
    label.hidden = NO;
    
    NSLog(@"%@ was added to selectedDie", label.text);
    
    
        if (self.winSpotTakenOne == NO) {
            [UIView animateWithDuration:1 animations:^{
                [label setFrame:winDieOneFrame];

            }];
    
    
            winDieOne.text = label.text;
            self.winSpotTakenOne = YES;
        }
    
        else if (self.winSpotTakenTwo == NO) {
            [UIView animateWithDuration:1 animations:^{
                label.frame = winDieTwoFrame;

            }];
            self.winSpotTakenTwo = YES;
    
        }
    
        else if (self.winSpotTakenThree == NO) {
            [UIView animateWithDuration:1 animations:^{
                label.frame = winDieThreeFrame;

            }];
            self.winSpotTakenThree = YES;
    
        }
        else if (self.winSpotTakenFour == NO) {
            [UIView animateWithDuration:1 animations:^{
                label.frame = winDieFourFrame;

            }];
            self.winSpotTakenFour = YES;
    
        }
        else if (self.winSpotTakenFive == NO) {
            [UIView animateWithDuration:1 animations:^{
                label.frame = winDieFiveFrame;

            }];
            self.winSpotTakenFive = YES;
    
        }
        else if (self.winSpotTakenSix == NO) {
            [UIView animateWithDuration:1 animations:^{
                label.frame = winDieSixFrame;

            }];
            self.winSpotTakenSix = YES;
    
        }
    
    
    
}
- (IBAction)rackEmButtonWasTapped:(UIButton *)sender {
    [self rackEm:self.selectedDie];
    if (self.selectedDie.count == 6) {
        [self.selectedDie removeAllObjects];
        self.selectedDie = [[NSMutableArray alloc] init];
        self.RackEm.titleLabel.text = @"Next Player's Turn";
        /// add logic to set up next players turn
    
    }
    self.RackEm.hidden = YES;
    self.Stay.hidden = NO;
}
- (IBAction)stayButtonTapped:(id)sender {
    [self stayFunc];
    
}

- (void) rackEm :(NSMutableArray *) selectedDie {
    
    NSCountedSet *countedSet = [[NSCountedSet alloc] initWithArray:selectedDie];
    
    NSLog(@"%@", countedSet);
    
    NSEnumerator *enumerator = [countedSet objectEnumerator];
    
    for (NSNumber *key in enumerator){
        
        NSNumber *occurance = [NSNumber numberWithUnsignedLong:[countedSet countForObject:key]];
        
        NSLog(@"%@ has been played", key);
        NSLog(@"%@ times", occurance);
        
        // If 1 then multi by one
        if ([key isEqual:@"1"] ) {
            int hundo = 100;
            self.turnsSum = [NSNumber numberWithInt:(hundo * [occurance intValue])];
            self.didFarkle = NO;
        }
        
        // If 5 then multiple occurance by 5 and add to turnsum
        if (([key isEqual:@"5"] && [occurance isEqual:@1]) || ([key isEqual:@"5"] && [occurance isEqual:@2])) {
            int fiveSum = 50 * [occurance intValue];
            self.turnsSum = [self addTwoNSNumbers:self.turnsSum :[NSNumber numberWithInt:fiveSum]];
            self.didFarkle = NO;
        }
        
        //If three OF a kind
        if ([occurance isEqual: @3] && (![key isEqual:@"1"])) {
            NSLog(@"theres a three of a kind amoungst us");
            self.turnsSum = [self addTwoNSNumbers:self.turnsSum :[NSNumber numberWithInt:(100 * [occurance intValue])]];
            self.didFarkle = NO;
        }
        
        if ([occurance isEqual: @3] && ([key isEqual:@"1"])) {
            NSLog(@"theres a three of a kind amoungst us");
            self.turnsSum = [self addTwoNSNumbers:self.turnsSum :[NSNumber numberWithInt:(100 * [occurance intValue])]];
            self.didFarkle = NO;
        }
        
        if ([occurance isEqual: @4] && (![key isEqual:@"1"])) {
            NSLog(@"theres a four of a kind amoungst us");
            self.turnsSum = [self addTwoNSNumbers:self.turnsSum :@1000];
            self.didFarkle = NO;
        }
        
        if ([occurance isEqual: @4] && ([key isEqual:@"1"])) {
            NSLog(@"theres a four of a kind amoungst us");
            self.turnsSum = [self addTwoNSNumbers:self.turnsSum :@1000];
            self.didFarkle = NO;
        }
        
        if ([occurance isEqual: @5] && (![key isEqual:@"1"])) {
            NSLog(@"theres a five of a kind amoungst us");
            self.turnsSum = [self addTwoNSNumbers:self.turnsSum :@2000];
            self.didFarkle = NO;
            
        }
        
        if ([occurance isEqual: @5] && ([key isEqual:@"1"])) {
            NSLog(@"theres a five of kind of ones amoungst us");
            self.turnsSum = [self addTwoNSNumbers:self.turnsSum :@2000];
            self.didFarkle = NO;
            
        }
        
        if ([occurance isEqual: @6]) {
            NSLog(@"theres a six of a kind amoungst us");
            self.turnsSum = @3000;
            self.didFarkle = NO;
        }
        
    }
    
    //SET THE LABEL TO THE FINAL SUM
    
    self.NetSum = [self addTwoNSNumbers:self.turnsSum :self.NetSum];
    self.turnsSum = @0;
    self.SumLabel.text = [NSString stringWithFormat:@"%@", self.NetSum];
    
//    self.diceRollButton.hidden = NO;
    
    //CHECK FOR FARKLE
    
    if (self.didFarkle == YES) {
        [self fireFarklizer];
    }
    
    
    
}

- (NSNumber *) addTwoNSNumbers:(NSNumber *) firstNum :(NSNumber *) secondNum {
    
    NSNumber *sum = [NSNumber numberWithInt:[firstNum intValue] + [secondNum intValue]];
    return sum;
}


-(void) fireFarklizer {
    UIAlertController *didFarkle = [UIAlertController alertControllerWithTitle:@"oh snap" message:@"You done Farkled son!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *retry = [UIAlertAction actionWithTitle:@"new game?" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [didFarkle addAction:retry];
    
    [self presentViewController:didFarkle animated:YES completion:nil];
    for (DieLabel *die in self.DieLabelCollection) {
        die.hidden = YES;
    }
    self.diceRollButton.hidden = NO;
    self.NetSum = 0;
    [self nextPlayersTurn];
}





-(void) stayFunc {
    NSString *finalPoints = [NSString stringWithFormat:@"%@", self.SumLabel.text];
    
    NSString *message = [NSString stringWithFormat:@"Great job you got %@", finalPoints];
    
    UIAlertController *didFarkle = [UIAlertController alertControllerWithTitle:@"Turn Over" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *retry = [UIAlertAction actionWithTitle:@"new game?" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [didFarkle addAction:retry];
    
    [self presentViewController:didFarkle animated:YES completion:nil];
    for (DieLabel *die in self.DieLabelCollection) {
        die.hidden = YES;
    }
    self.diceRollButton.hidden = NO;
    [self nextPlayersTurn];
}

-(void) nextPlayersTurn {
    
    int playerPlusOne = self.currentPlayer + 1;
    if ([self.playingPlayers objectAtIndex:playerPlusOne]) {
        self.currentPlayer++;
        Player *aPlayer = [self.playingPlayers objectAtIndex:self.currentPlayer];
        self.navigationItem.title = aPlayer.name;
        aPlayer.points = self.NetSum;

    }
}


//- (void) updateContraints :(UILabel *) label{
//        
//        //first remove the constraints
//        
//    label.translatesAutoresizingMaskIntoConstraints = NO;
//     
//        if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)) {
//            
//            //align the tops equal
//            self.bottomViewToTopConstraint = [NSLayoutConstraint constraintWithItem:self.bottomRightView
//                                                                          attribute:NSLayoutAttributeTop
//                                                                          relatedBy:NSLayoutRelationEqual
//                                                                             toItem:self.topLeftView
//                                                                          attribute:NSLayoutAttributeTop
//                                                                         multiplier:1.0
//                                                                           constant:0];
//            //align to the trailing edge by spacer
//            self.rightViewToLeftConstraint = [NSLayoutConstraint constraintWithItem:self.bottomRightView
//                                                                          attribute:NSLayoutAttributeLeading
//                                                                          relatedBy:NSLayoutRelationEqual
//                                                                             toItem:self.topLeftView
//                                                                          attribute:NSLayoutAttributeTrailing
//                                                                         multiplier:1.0
//                                                                           constant:self.spacer];
//        } else { //portrait
//            
//            //right view atached vertically to the bottom of topLeftView by spacer
//            self.bottomViewToTopConstraint = [NSLayoutConstraint constraintWithItem:self.bottomRightView
//                                                                          attribute:NSLayoutAttributeTop
//                                                                          relatedBy:NSLayoutRelationEqual
//                                                                             toItem:self.topLeftView
//                                                                          attribute:NSLayoutAttributeBottom
//                                                                         multiplier:1.0
//                                                                           constant:self.spacer];
//            
//            //bottom view left edge aligned to left edge of top view
//            self.rightViewToLeftConstraint = [NSLayoutConstraint constraintWithItem:self.bottomRightView
//                                                                          attribute:NSLayoutAttributeLeading
//                                                                          relatedBy:NSLayoutRelationEqual
//                                                                             toItem:self.topLeftView
//                                                                          attribute:NSLayoutAttributeLeading
//                                                                         multiplier:1.0
//                                                                           constant:0];
//        }
//        
//        [self.view addConstraints:@[self.rightViewToLeftConstraint, self.bottomViewToTopConstraint]];
//        
//        [super updateViewConstraints];}

@end
