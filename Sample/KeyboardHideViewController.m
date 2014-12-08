//
//  KeyboardHideViewController.m
//  Sample
//
//  Created by Koteswar on 15/11/14.
//  Copyright (c) 2014 Supreme-TechSolutions. All rights reserved.
//

#import "KeyboardHideViewController.h"
#import "IQKeyboardManager.h"

@interface KeyboardHideViewController ()

@end

@implementation KeyboardHideViewController
@synthesize testfield,imageview1;

- (void)viewDidLoad {
    [super viewDidLoad];
   // [[IQKeyboardManager sharedManager] setEnable:YES];
    
    
    self.testfield.delegate = self;
    self.text1.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.testfield resignFirstResponder];
     [self.text1 resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.testfield) {
        [self.testfield resignFirstResponder];
         [self.text1 resignFirstResponder];
    }
    return NO;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y - 170.0), self.view.frame.size.width, self.view.frame.size.height);
    [UIView commitAnimations];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.2];
    [UIView setAnimationBeginsFromCurrentState:YES];
    self.view.frame = CGRectMake(self.view.frame.origin.x, (self.view.frame.origin.y + 170.0), self.view.frame.size.width, self.view.frame.size.height);
    
    
}




@end
