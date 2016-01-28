//
//  DetailsVC.m
//  Week Two Assessment
//
//  Created by Aaron B on 1/22/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "DetailsVC.h"
#import "RootVC.h"
#import "WikiVC.h"

@interface DetailsVC ()
@property (weak, nonatomic) IBOutlet UILabel *parkNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *parkLocationDetail;
@property (weak, nonatomic) IBOutlet UITextField *parkNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *parkLocationTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property UIBarButtonItem *edit;
@property UIBarButtonItem *done;


@end

@implementation DetailsVC


- (void)viewDidLoad {
    [super viewDidLoad];

    self.parkNameLabel.text = self.selectedPark.parkName;
    self.parkNameLabel.textAlignment = NSTextAlignmentCenter;
    self.parkLocationDetail.text = self.selectedPark.parkLocation;
    self.parkLocationDetail.textAlignment  = NSTextAlignmentCenter;
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonAction)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonAction)];
    self.edit = editButton;
    self.done = doneButton;
    self.navigationItem.rightBarButtonItem = editButton;
    self.imageView.image = self.selectedPark.parkImage;
}


#pragma  mark - edit Buttons
-(void) editButtonAction {
    self.navigationItem.rightBarButtonItem = self.done;
    self.navigationItem.titleView.hidden = YES;
    self.parkNameLabel.alpha = .5;
    self.parkLocationDetail.alpha = .5;
    self.parkNameTextField.hidden = NO;
    self.parkLocationTextField.hidden = NO;
}


-(void) doneButtonAction {
    self.selectedPark.parkName = self.parkNameTextField.text;
    self.selectedPark.parkLocation = self.parkLocationTextField.text;
    self.parkNameLabel.text = self.selectedPark.parkName;
    self.parkLocationDetail.text = self.selectedPark.parkLocation;

    self.navigationItem.rightBarButtonItem = self.edit;
    self.navigationItem.titleView.hidden = NO;
   
    self.parkNameLabel.alpha = .75;
    self.parkLocationDetail.alpha = .75;
    self.parkNameTextField.hidden = YES;
    self.parkLocationTextField.hidden = YES;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WikiVC *destination = segue.destinationViewController;
    destination.selectedPark = self.selectedPark;
}

- (IBAction)onWikiButtonTapped:(UIButton *)sender {
    

}

- (IBAction)addTitle:(UIButton *)sender {
    [self.selectedPark sendTitleToDelegate:sender];
    
}


@end
