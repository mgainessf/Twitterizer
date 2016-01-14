//
//  TwitterizerViewController.m
//  Twitterizer
//
//  Created by Aaron B on 1/13/16.
//  Copyright © 2016 mobile makers. All rights reserved.
//

#import "TwitterizerViewController.h"

@interface TwitterizerViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property int buttonPressed;

@end

@implementation TwitterizerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonPressed = 0;
}

- (void)textViewDidChange:(UITextView *)textView {
    NSUInteger lengthOfTextView = self.textView.text.length;
    self.label.text = [NSString stringWithFormat:@"%lu", 140-lengthOfTextView];
}


-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSUInteger lengthOfTextView = self.textView.text.length;
    if (lengthOfTextView == 0){
        if (lengthOfTextView != 0){
            return YES;
        }
    }
    else if (lengthOfTextView > 139){
        return NO;
    }
    return YES;
}


- (IBAction)hashTagButton:(id)sender {
    NSUInteger textLength = self.textView.text.length;
    NSString *hashtagText = self.textView.text;
    NSString *spaceString = @" ";
    NSString *hashString = @"#";
    int num = 0;
    self.buttonPressed++;
    if (self.buttonPressed == 1){
        for (int i = 0; i < textLength; i++) {
            NSString *checkIfSpace = [hashtagText substringWithRange:NSMakeRange(i, 1)];
            if ([checkIfSpace isEqualToString:spaceString] && i != 0){
                num++;
                if ([hashtagText substringWithRange:NSMakeRange(i + 1, 1)] != spaceString && num % 2 != 0) {
                    hashtagText = [hashtagText stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@" #"];
                }
            }
        }
    }
    
    if (self.buttonPressed == 2) {
        NSString *firstLetter = [NSString stringWithFormat:@"#%@",[hashtagText substringWithRange:NSMakeRange(0,1)]];
        hashtagText = [hashtagText stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:firstLetter];
        for (int i = 0; i < textLength; i++) {
            NSString *checkingSpace = [hashtagText substringWithRange:NSMakeRange(i, 1)];
            NSString *checkingHashSpace = [hashtagText substringWithRange:NSMakeRange(i + 1, 1)];
            if ([checkingSpace isEqualToString:spaceString] && ![checkingHashSpace isEqualToString:hashString]) {
             hashtagText = [hashtagText stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@" #"];
            }
        }
        }
    self.textView.text = hashtagText;
    NSLog(@"%i", self.buttonPressed);
    
}


- (IBAction)twitterizeButton:(id)sender {
    NSString *twitterText = self.textView.text;
    NSMutableString *newTwitterText = [[NSMutableString alloc] init];
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aeiouAEIOU"];
    
    for (int i = 0; i < twitterText.length; i++){
        if (![vowels characterIsMember:[twitterText characterAtIndex:i]]){
            [newTwitterText appendFormat:@"%c", [twitterText characterAtIndex:i]];
            self.textView.text = newTwitterText;
        }
    }
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
