//
//  SandikLoginViewController.m
//  e-Sandık
//
//  Created by Alperen Kavun on 10.06.2013.
//  Copyright (c) 2013 Halıcı. All rights reserved.
//

#import "SandikLoginViewController.h"
#import "RNEncryptor.h"
#import "RNDecryptor.h"
#import "NSData+Base64.h"
#import "APIManager.h"
#import "SandikSorguViewController.h"

@interface SandikLoginViewController ()

@end

@implementation SandikLoginViewController
{
    NSString* currentUsername;
    NSString* currentPassword;
    NSString* currentTckNo;
    UIActivityIndicatorView* activityIndicator;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Geri"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:nil];
    UIImage *buttonImage = [UIImage imageNamed:@"btn_back_normal.png"];
    
    UIImage *hoverButtonImage = [UIImage imageNamed:@"btn_back_hover.png"];
    
    [backButton setBackButtonBackgroundImage:buttonImage
                                    forState:UIControlStateNormal
                                  barMetrics:UIBarMetricsDefault];
    
    [backButton setBackButtonBackgroundImage:hoverButtonImage
                                    forState:UIControlStateHighlighted
                                  barMetrics:UIBarMetricsDefault];
    
    self.navigationItem.backBarButtonItem = backButton;
    
    UIImage *image = [UIImage imageNamed:@"title_esandik.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    self.navigationItem.titleView = imageView;
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.usernameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.passwordField];
    
    NSData* encryptedUsername = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_KEY_USERNAME];
    NSData* encryptedPassword = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_KEY_PASSWORD];
    
    if (encryptedUsername != nil && encryptedPassword != nil) {
        NSError* error;
        NSError* error2;
        
        NSData* decryptedUsername = [RNDecryptor decryptData:encryptedUsername withPassword:ENCRYPTION_KEY error:&error];
        NSData* decryptedPassword = [RNDecryptor decryptData:encryptedPassword withPassword:ENCRYPTION_KEY error:&error2];
        
        currentUsername = [NSKeyedUnarchiver unarchiveObjectWithData:decryptedUsername];
        currentPassword = [NSKeyedUnarchiver unarchiveObjectWithData:decryptedPassword];
    }
    else {
        currentUsername = nil;
        currentPassword = nil;
    }
    
    if (currentUsername != nil && currentPassword != nil) {
        [self.usernameField setText:currentUsername];
        [self.passwordField setText:currentPassword];
        self.usernameField.clearButtonMode = UITextFieldViewModeAlways;
        self.passwordField.clearButtonMode = UITextFieldViewModeAlways;
    }
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString* replacedString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (textField == self.usernameField) {
        if (replacedString.length > 11) {
            NSRange fieldRange = {0, 11};
            textField.text = [replacedString substringWithRange:fieldRange];
            
            return NO;
        } else {
            return YES;
        }
    } else {
        return YES;
    }

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.usernameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField.text.length == 0) {
        textField.clearButtonMode = UITextFieldViewModeNever;
    }
    else {
        textField.clearButtonMode = UITextFieldViewModeAlways;
    }
}
- (void)textFieldDidChange:(NSNotification *)notif {
    if (notif.object == self.usernameField) {
        if (self.usernameField.text.length == 0) {
            self.usernameField.clearButtonMode = UITextFieldViewModeNever;
        }
        else {
            self.usernameField.clearButtonMode = UITextFieldViewModeAlways;
        }
    }
    else if (notif.object == self.passwordField) {
        if (self.passwordField.text.length == 0) {
            self.passwordField.clearButtonMode = UITextFieldViewModeNever;
        }
        else {
            self.passwordField.clearButtonMode = UITextFieldViewModeAlways;
        }
    }
}

- (void)keyboardWillShow:(NSNotification *)notif {
    NSDictionary* userInfo = [notif userInfo];
    
    // Get animation info from userInfo
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    
    [UIView animateWithDuration:animationDuration
                     animations:^{
                         CGRect frame = self.view.frame;
                         frame.origin.y = -80;
                         [self.view setFrame:frame];
                     }];
}

- (void)keyboardWillHide:(NSNotification *)notif {
    NSDictionary* userInfo = [notif userInfo];
    
    // Get animation info from userInfo
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    
    [UIView animateWithDuration:animationDuration
                     animations:^{
                         CGRect frame = self.view.frame;
                         frame.origin.y = 0;
                         [self.view setFrame:frame];
                     }];
}
- (void)viewDidUnload {
    [self setUsernameField:nil];
    [self setPasswordField:nil];
    [self setLoginButton:nil];
    [super viewDidUnload];
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [self.usernameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    if ([[segue identifier] isEqualToString:@"LoginSegue"]) {
        SandikSorguViewController* sorguViewController = [segue destinationViewController];
        [sorguViewController setCurrentUsername:currentUsername];
        [sorguViewController setCurrentPassword:currentPassword];
        [sorguViewController setCurrentTckNo:currentTckNo];
    }
}
- (IBAction)checkLogin:(id)sender {
    
    long long int myText = [self.usernameField.text longLongValue];
    NSString *username = [NSString stringWithFormat:@"%llu",myText];
    NSString* aPassword = self.passwordField.text;
    if ([username length] == 11 || [username length] == 10){
        
        if (aPassword != nil && ![aPassword isEqualToString:@""]) {
            activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            [activityIndicator setFrame:CGRectMake(0.0, 0.0, 34.0, 34.0)];
            [self.loginButton addSubview:activityIndicator];
            [activityIndicator startAnimating];
            
            [self.view setUserInteractionEnabled:NO];
            
            [[APIManager sharedInstance] loginWithUsername:username andPassword:aPassword onCompletion:^(NSString *tckNo) {
                NSData* user = [NSKeyedArchiver archivedDataWithRootObject:username];
                NSData* pass = [NSKeyedArchiver archivedDataWithRootObject:aPassword];
                NSError* error2;
                NSError* error;
                NSData* encryptedUsername = [RNEncryptor encryptData:user withSettings:kRNCryptorAES256Settings password:ENCRYPTION_KEY error:&error];
                NSData* encryptedPassword = [RNEncryptor encryptData:pass withSettings:kRNCryptorAES256Settings password:ENCRYPTION_KEY error:&error2];
                
                [[NSUserDefaults standardUserDefaults] setObject:encryptedUsername forKey:USER_DEFAULTS_KEY_USERNAME];
                [[NSUserDefaults standardUserDefaults] setObject:encryptedPassword forKey:USER_DEFAULTS_KEY_PASSWORD];
                [[NSUserDefaults standardUserDefaults] synchronize];
                currentUsername = username;
                currentPassword = aPassword;
                currentTckNo = tckNo;
                [activityIndicator stopAnimating];
                [activityIndicator removeFromSuperview];
                activityIndicator = nil;
                [self.view setUserInteractionEnabled:YES];
                [self performSegueWithIdentifier:@"LoginSegue" sender:self];
            } onError:^(NSError *error) {
                [activityIndicator stopAnimating];
                [activityIndicator removeFromSuperview];
                activityIndicator = nil;
                [self.view setUserInteractionEnabled:YES];
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hata" message:[error localizedDescription] delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
                [alertView show];
            }];
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hata" message:@"Lütfen şifrenizi giriniz." delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
            [alertView show];
        }
        
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hata" message:@"Lütfen 11 haneli T.C. Kimlik numaranızı veya telefon numaranızı giriniz." delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
        [alertView show];
        
        
    }
    
}
@end
