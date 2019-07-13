//
//  LoginPageViewController.m
//  InstagramClone
//
//  Created by sbernal0115 on 7/8/19.
//  Copyright © 2019 sbernal0115. All rights reserved.
//

#import "LoginPageViewController.h"
#import "FeedViewController.h"
#import "SignUpViewController.h"
#import "Parse/Parse.h"

@interface LoginPageViewController ()

@end

@implementation LoginPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}



- (void) incorrectCredentials
{
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Incorrect Credentials"
                                                                   message:@"Please check inputted username/password"
                                                            preferredStyle:(UIAlertControllerStyleAlert)];
    
    // create an OK action
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         // handle response here.
                                                     }];
    // add the OK action to the alert controller
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}



- (void)loginUser {
    NSString *username = self.usernameText.text;
    NSString *password = self.passwordText.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
            [self incorrectCredentials];
            
            
        } else {
            NSLog(@"User logged in successfully");
            
            // display view controller that needs to shown after successful login
             [self performSegueWithIdentifier:@"SignedIn" sender:self];
        }
    }];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
}




- (IBAction)signinButton:(id)sender {
    [self loginUser];
}

- (IBAction)signupButton:(id)sender {
}


- (IBAction)usernameAction:(id)sender {
    [self.usernameText resignFirstResponder];
}

- (IBAction)passwordAction:(id)sender {
    [self.passwordText resignFirstResponder];
}



@end
