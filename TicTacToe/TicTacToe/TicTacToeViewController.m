//
//  TicTacToeViewController.m
//  TicTacToe
//
//  Created by Aaron B on 1/14/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "TicTacToeViewController.h"

@interface TicTacToeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonCollection;
@property NSMutableSet *selectedButtons;
@property NSMutableArray *buttonNames;
@end

@implementation TicTacToeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.selectedButtons = [[NSMutableSet alloc] init];
    self.buttonNames = [[NSMutableArray alloc] initWithObjects:
                        @"buttonOne",
                        @"buttonTwo",
                        @"buttonThree",
                        @"buttonFour",
                        @"buttonFive",
                        @"buttonSix",
                        @"butonSeven",
                        @"buttonEight",
                        @"buttonNine",
                        nil];
}

// User Function
-(void) userDidPress:(NSNumber*)addObjectWithNumber {
        //[self.buttonOne setTitle:@"X" forState:UIControlStateNormal]; // add X
        [self.selectedButtons addObject:addObjectWithNumber]; // add 1 to array
        //self.buttonOne.enabled =NO; // disable button
    }

//Computer Functions
-(BOOL) computersTurn:(NSNumber *)addObjectWithString {
     NSNumber *randomNumber = [self generateRandomNumber:YES];
    if([self numberHasBeenPreviouslySelected:self.selectedButtons randomnumber:randomNumber] == NO){
       // [currentButtonsName setTitle:@"O" forState:UIControlStateNormal];
        // add clicked button to array
    }
    return YES;
}

                                        

- (UIButton*) buttonNameByNumber:(UInt32)num {
    UIButton * buttonNumber = [self.buttonNames objectAtIndex:num];
    return buttonNumber;
}


- (NSNumber *) generateRandomNumber: (BOOL) startGenerating {
    if (startGenerating == YES){
        UInt32 randomNumber = arc4random_uniform(8);
        NSNumber *randomNumberAsNSNumber = [NSNumber numberWithInt:randomNumber];
        return randomNumberAsNSNumber;
    }
    else {
        return 0;
    }
}


-(BOOL) numberHasBeenPreviouslySelected:(NSMutableSet *)selectedNumbers randomnumber:(NSNumber*)randomnNumber  {
    if ([selectedNumbers containsObject:randomnNumber]){
        return YES;
    }
    else {
        return NO;
    }
}



- (IBAction)onButtonTappedOne:(UIButton *)sender {
    
}


- (IBAction)onButtonTappedTwo:(UIButton *)sender {
    
}
- (IBAction)onButtonTappedThree:(UIButton *)sender {
    
}
- (IBAction)onButtonTappedFour:(UIButton *)sender {
}
- (IBAction)onButtonTappedFive:(UIButton *)sender {
}
- (IBAction)onButtonTappedSix:(UIButton *)sender {
}
- (IBAction)onButtonTappedSeven:(UIButton *)sender {
}
- (IBAction)onButtonTappedEight:(UIButton *)sender {
}
- (IBAction)onButtonTappedNine:(UIButton *)sender {
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
