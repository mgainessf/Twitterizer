//
//  addGOTActorViewController.m
//  gameOfThrones
//
//  Created by Aaron B on 1/26/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "addGOTActorViewController.h"
#import "GameOfThronesTableViewController.h"
#import "AppDelegate.h"

@interface addGOTActorViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *actorTextField;
@property (weak, nonatomic) IBOutlet UITextField *characterTextField;
@property (weak, nonatomic) IBOutlet UIButton *buttonView;
@property NSMutableDictionary *aNewDict;
@property NSManagedObjectContext *moc;


@end

@implementation addGOTActorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.aNewDict = [[NSMutableDictionary alloc] init];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
}

- (IBAction)onCommitGOTButtonTapped:(id)sender {
    [self.view resignFirstResponder];
    GOTActor *newActor = [[GOTActor alloc] init];
    newActor.actor = self.actorTextField.text;
    newActor.character = self.characterTextField.text;
    [self.delegate updateTableView];
    
    NSError *error;
    
    if ([self.moc save:&error]) {
    }
    else {
        NSLog(@"An Error Occured🤓");
    }
    
}




    


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


- (IBAction)buttonView:(UIButton *)sender {
    
}

@end
