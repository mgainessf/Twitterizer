//
//  MultiplicationCalculatorViewController.m
//  weekOneAssesment
//
//  Created by Aaron B on 1/15/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "MultiplicationCalculatorViewController.h"
#import "WebViewController.h"
@interface MultiplicationCalculatorViewController () <UINavigationBarDelegate>
@property (weak, nonatomic) IBOutlet UITextField *valueOneTextField;
@property (weak, nonatomic) IBOutlet UITextField *valueTwoTextField;
@property (weak, nonatomic) IBOutlet UINavigationItem *NavItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *webBarButtonItem;
@property (weak, nonatomic) IBOutlet UIButton *resignButton;
@property int currentNavigationTitle;

@end

@implementation MultiplicationCalculatorViewController

- (void)viewDidLoad {
    self.webBarButtonItem.enabled = NO;
    [super viewDidLoad];
}
- (IBAction)CalculateButton:(UIButton *)sender {
    int firstValue  = [self.valueOneTextField.text intValue];
    int secondValue  = [self.valueTwoTextField.text intValue];
    int totalValue = firstValue * secondValue;
    self.currentNavigationTitle = totalValue;
    NSLog(@"%i,", totalValue);
    self.NavItem.title = [NSString stringWithFormat:@"%i", totalValue];
    [self.view endEditing:YES];
    if (totalValue % 3 == 0){
        self.webBarButtonItem.enabled = YES;
    }
    if (totalValue >= 20){
        self.resignButton.backgroundColor = [UIColor purpleColor];
    }

}

- (IBAction)resignButton:(UIButton *)sender {
    [self.view endEditing:YES];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebViewController *destination = segue.destinationViewController;
    destination.navigationTitle = self.currentNavigationTitle;
}


@end
