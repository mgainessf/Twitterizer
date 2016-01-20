//
//  MagicalCreatureViewController.m
//  MCMS
//
//  Created by Aaron B on 1/19/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "MagicalCreatureViewController.h"
#import "RootViewController.h"

@interface MagicalCreatureViewController ()
@property UIBarButtonItem *edit;
@property UIBarButtonItem *done;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UITextField *textFieldOne;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTwo;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@property (weak, nonatomic) IBOutlet UITextField *textFieldThree;

@end

@implementation MagicalCreatureViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstLabel.text = self.currentCreature.name;
    self.secondLabel.text = self.currentCreature.detail;
    self.thirdLabel.text = self.currentCreature.accessory;
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonAction)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonAction)];
    self.edit = editButton;
    self.done = doneButton;
    self.navigationItem.rightBarButtonItem = editButton;
    self.textFieldOne.placeholder = self.currentCreature.name;
    self.textFieldTwo.placeholder = self.currentCreature.detail;
    self.textFieldThree.placeholder = self.currentCreature.accessory;
}

-(void) editButtonAction {
    self.navigationItem.rightBarButtonItem = self.done;
    self.navigationItem.titleView.hidden = YES;
    self.firstLabel.hidden = YES;
    self.secondLabel.hidden = YES;
    self.thirdLabel.hidden = YES;
    self.textFieldOne.hidden = NO;
    self.textFieldTwo.hidden = NO;
    self.textFieldThree.hidden = NO;
}

-(void) doneButtonAction {
    self.currentCreature.name = self.textFieldOne.text;
    self.currentCreature.detail = self.textFieldTwo.text;
    self.currentCreature.accessory = self.textFieldThree.text;
    self.firstLabel.text = self.currentCreature.name;
    self.secondLabel.text = self.currentCreature.detail;
    self.thirdLabel.text = self.currentCreature.accessory;
    self.navigationItem.rightBarButtonItem = self.edit;
    self.navigationItem.titleView.hidden = NO;
    self.firstLabel.hidden = NO;
    self.secondLabel.hidden = NO;
    self.thirdLabel.hidden = NO;
    self.textFieldOne.hidden = YES;
    self.textFieldTwo.hidden = YES;
    self.textFieldThree.hidden = YES;
    
}



@end
