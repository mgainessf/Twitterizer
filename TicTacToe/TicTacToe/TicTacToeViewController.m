//
//  TicTacToeViewController.m
//  TicTacToe
//
//  Created by Aaron B on 1/14/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "TicTacToeViewController.h"

@interface TicTacToeViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *whosTurnLabel;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (strong, nonatomic) IBOutlet UIView *viewController;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonCollection;
@property NSMutableSet *selectedButtons;
@property NSMutableSet *userSelected;
@property NSMutableSet *computerSelected;
@property NSArray *winningArrayOneFiveNine;
@property NSArray *winningArrayTwoFiveEight;
@property NSArray *winningArrayThreeFiveSeven;
@property NSArray *winningArrayOneFourSeven;
@property NSArray *winningArrayThreeSixNine;
@property NSArray *winningArrayOneTwoThree;
@property NSArray *winningArrayFourFiveSix;
@property NSArray *winningArraySevenEightNine;
@end

@implementation TicTacToeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self displayTurn:@"Your"];
    self.view.backgroundColor = [UIColor colorWithRed:85/255.00 green:145/255.00 blue:127/255.00 alpha:1];
    self.whosTurnLabel.text = @"Tic Tac Toe";
    self.whosTurnLabel.textColor = [UIColor colorWithRed:255/255.00 green:226/255.00 blue:209/255.00 alpha:1];
    //buttons selected
    self.selectedButtons = [[NSMutableSet alloc] init];
    self.computerSelected = [[NSMutableSet alloc] init];
    self.userSelected = [[NSMutableSet alloc] init];
    
    //winningArays
    self.winningArrayOneFiveNine =  [NSArray arrayWithObjects:
                                     [NSNumber numberWithInt:0],
                                     [NSNumber numberWithInt:4],
                                     [NSNumber numberWithInt:8], nil];
    self.winningArrayTwoFiveEight =  [NSArray arrayWithObjects:
                                      [NSNumber numberWithInt:1],
                                      [NSNumber numberWithInt:4],
                                      [NSNumber numberWithInt:7], nil];
    self.winningArrayThreeFiveSeven =  [NSArray arrayWithObjects:
                                        [NSNumber numberWithInt:2],
                                        [NSNumber numberWithInt:4],
                                        [NSNumber numberWithInt:6], nil];
    self.winningArrayOneFourSeven =  [NSArray arrayWithObjects:
                                      [NSNumber numberWithInt:0],
                                      [NSNumber numberWithInt:3],
                                      [NSNumber numberWithInt:6], nil];
    self.winningArrayThreeSixNine =  [NSArray arrayWithObjects:
                                      [NSNumber numberWithInt:2],
                                      [NSNumber numberWithInt:5],
                                      [NSNumber numberWithInt:8], nil];
    self.winningArrayOneTwoThree =  [NSArray arrayWithObjects:
                                      [NSNumber numberWithInt:0],
                                      [NSNumber numberWithInt:1],
                                      [NSNumber numberWithInt:2], nil];
    self.winningArrayFourFiveSix =  [NSArray arrayWithObjects:
                                     [NSNumber numberWithInt:3],
                                     [NSNumber numberWithInt:4],
                                     [NSNumber numberWithInt:5], nil];
    self.winningArraySevenEightNine =  [NSArray arrayWithObjects:
                                     [NSNumber numberWithInt:6],
                                     [NSNumber numberWithInt:7],
                                     [NSNumber numberWithInt:8], nil];
}


//Computer's Turn
-(void) computersTurn: (BOOL) startTurn{
    [self displayTurn:@"Computer's"];
    int rand = [self getRandNum];
    while (rand == -1){
        rand = [self getRandNum];
    }
    [self.selectedButtons addObject:[NSNumber numberWithInt:rand]];
    [self.computerSelected addObject:[NSNumber numberWithInt:rand]];
    [self clickButton:[NSNumber numberWithInt:rand] :@"O"];
    [self displayTurn:@"Your "];
    //[self displayCounter];
}

-(BOOL) didComputerWin {
    int one = [self iterateThroughWinningSets:self.computerSelected :self.winningArrayOneFiveNine];
    int two = [self iterateThroughWinningSets:self.computerSelected :self.winningArrayTwoFiveEight];
    int three = [self iterateThroughWinningSets:self.computerSelected :self.winningArrayThreeFiveSeven];
    int four = [self iterateThroughWinningSets:self.computerSelected :self.winningArrayOneFourSeven];
    int five = [self iterateThroughWinningSets:self.computerSelected :self.winningArrayThreeSixNine];
    int six = [self iterateThroughWinningSets:self.computerSelected :self.winningArrayOneTwoThree];
    int seven = [self iterateThroughWinningSets:self.computerSelected :self.winningArrayFourFiveSix];
    int eight = [self iterateThroughWinningSets:self.computerSelected :self.winningArraySevenEightNine];
    if ((one || two || three || four || five || six || seven || eight) == 1){
        return YES;
    }
    return NO;
}

-(BOOL) didUserWin {
    int one = [self iterateThroughWinningSets:self.userSelected :self.winningArrayOneFiveNine];
    int two = [self iterateThroughWinningSets:self.userSelected :self.winningArrayTwoFiveEight];
    int three = [self iterateThroughWinningSets:self.userSelected :self.winningArrayThreeFiveSeven];
    int four = [self iterateThroughWinningSets:self.userSelected :self.winningArrayOneFourSeven];
    int five = [self iterateThroughWinningSets:self.userSelected :self.winningArrayThreeSixNine];
    int six = [self iterateThroughWinningSets:self.userSelected :self.winningArrayOneTwoThree];
    int seven = [self iterateThroughWinningSets:self.userSelected :self.winningArrayFourFiveSix];
    int eight = [self iterateThroughWinningSets:self.userSelected :self.winningArraySevenEightNine];
    if ((one || two || three || four || five || six || seven || eight) == 1){
        return YES;
    }
    return NO;
}



//Get next available number
- (NSNumber *)getNextNum {
    int i = 0;
    while ([self.selectedButtons containsObject:[NSNumber numberWithInt:i]]) {
        i++;
    }
    return [NSNumber numberWithInt:i];
    
}

// Generate a random Number
- (int)getRandNum {
    UInt32 randNum = arc4random_uniform(9);
    if ([self.selectedButtons containsObject:[NSNumber numberWithInt:randNum]]) {
        return -1;
    }
    return randNum;
}

//  Clicks a button and disables the button from being clicked again
-(void) clickButton:(NSNumber*)buttonsNumber :(NSString *)stringXorO{
    int indexNumber = [buttonsNumber intValue];
    UIButton *currentButton = [self.buttonCollection objectAtIndex:indexNumber];
    if ([stringXorO isEqualToString:@"X"]) {
          currentButton.enabled =NO;
        [currentButton setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateDisabled];
        [currentButton setTitleColor:[UIColor colorWithRed:94/255.00 green:76/255.00 blue:90/255.00 alpha:1] forState:UIControlStateDisabled];

    }
    else if ([stringXorO  isEqualToString: @"O"]){
        [currentButton setTitleColor:[UIColor colorWithRed:107/255.00 green:171/255.00 blue:144/255.00 alpha:1] forState:UIControlStateNormal];
        [currentButton setTitle:[NSString stringWithFormat:@"O"] forState:UIControlStateNormal];
    }
    // disable button
}

//adds button's number to the NSMutable Set selectedButtons
-(void) addButtonNumberToCollection:(NSNumber *) buttonsNumber :(NSMutableSet*) selectedButtons{
    [selectedButtons addObject: buttonsNumber];// add number to NSSET)
    
}

// Iterates through a winning set
- (int) iterateThroughWinningSets:(NSMutableSet*) selectedSet :(NSArray*) winningSet {
    int threeInaRow = 0;
    for (NSNumber *num in winningSet) {
        if ([selectedSet containsObject:[NSNumber numberWithInt:[num intValue]]]){
            threeInaRow++;
        }
        else {
            return 0;
        }
    }
    if (threeInaRow == 3){
        NSLog(@"%i", threeInaRow);
        return 1;
    }
    NSLog(@"%i", threeInaRow);
    return  1;
}
// iterate through all wining sets

//GAME OVER
-(void) gameOver:(NSString *) whoWon{
    NSString *thisPersonWon = [NSString stringWithFormat:@"%@ won!", whoWon];
    UIAlertController *gamefinishedAlert = [UIAlertController alertControllerWithTitle:@"Game Over" message:thisPersonWon preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"Play Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {    // cancel
    }];
    [self presentViewController:gamefinishedAlert animated:YES completion:nil];
    [gamefinishedAlert addAction:dismiss];
    [self.selectedButtons removeAllObjects];
    [self.userSelected removeAllObjects];
    [self.computerSelected removeAllObjects];
    for (UIButton *button in self.buttonCollection) { //enable all the buttons
        button.enabled = YES;
        [button setTitle:@"" forState:UIControlStateNormal];
    }
    
}
//TURN SEQUENCE
- (void) userDidClick: (NSNumber*) squareNumber {
    [self clickButton:squareNumber :@"X"];
    [self addButtonNumberToCollection:squareNumber :self.userSelected];
    [self addButtonNumberToCollection:squareNumber :self.selectedButtons];
    BOOL didUserWin = [self didUserWin];
    BOOL didComputerWin = [self didComputerWin];
    if (didUserWin == NO && didComputerWin == NO && self.selectedButtons.count > 7) {
        [self gameOver:@"Nobody "];
        self.counterLabel.text =@"0";
    }
    else if (didUserWin == YES) {
        [self gameOver:@"You "];
        self.counterLabel.text =@"0";

    }
    else {
        if (self.selectedButtons.count != 8) {
            [self computersTurn:YES];
            if (didComputerWin == YES) {
                [self gameOver:@"The computer's superior intellegence "];
                self.counterLabel.text =@"0";

            }
        }
    }
}
//DISPLAYS CURRENT TURN
/*-(void) displayCounter {
    self.counterLabel.text = @"10";
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(itsTheFinalCountDown:) userInfo:nil repeats:YES];
}
 -(void)itsTheFinalCountDown:(NSTimer *) theTimer {
 self.counterLabel.text = [NSString stringWithFormat:@"%d",[self.counterLabel.text  intValue] - 1];
 if ([self.counterLabel.text isEqualToString:@"0"]) {
 [self gameOver:@"You took too long! The Computer "];
 [theTimer invalidate];
 }
 }
*/


-(void) displayTurn:(NSString *) whosTurn {
    NSString *thisTurn = [NSString stringWithFormat:@"%@ turn", whosTurn];
    self.whosTurnLabel.text = thisTurn;
}


//Button Actions

- (IBAction)onButtonTappedOne:(UIButton *)sender {
    [self userDidClick:@0];
}

- (IBAction)onButtonTappedTwo:(UIButton *)sender {
    [self userDidClick:@1];
}
- (IBAction)onButtonTappedThree:(UIButton *)sender {
    [self userDidClick:@2];
}
- (IBAction)onButtonTappedFour:(UIButton *)sender {
    [self userDidClick:@3];
}
- (IBAction)onButtonTappedFive:(UIButton *)sender {
    [self userDidClick:@4];
}
- (IBAction)onButtonTappedSix:(UIButton *)sender {
    [self userDidClick:@5];
}
- (IBAction)onButtonTappedSeven:(UIButton *)sender {
    [self userDidClick:@6];
}
- (IBAction)onButtonTappedEight:(UIButton *)sender {
    [self userDidClick:@7];
}
- (IBAction)onButtonTappedNine:(UIButton *)sender {
    [self userDidClick:@8];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
