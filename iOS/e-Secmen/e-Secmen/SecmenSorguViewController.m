//
//  SecmenSorguViewController.m
//  e-Secmen
//
//  Created by Alperen Kavun on 05.07.2013.
//  Copyright (c) 2013 halici. All rights reserved.
//

#import "SecmenSorguViewController.h"

#import "SecmenTabBarViewController.h"
#import "APIManager.h"

@interface SecmenSorguViewController ()

@end

@implementation SecmenSorguViewController
{
    Voter* currentVoter;
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.tckNoTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.fatherNameField];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.tckNoTextField resignFirstResponder];
    [self.fatherNameField resignFirstResponder];
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
    if (notif.object == self.tckNoTextField) {
        if (self.tckNoTextField.text.length == 0) {
            self.tckNoTextField.clearButtonMode = UITextFieldViewModeNever;
        }
        else {
            self.tckNoTextField.clearButtonMode = UITextFieldViewModeAlways;
        }
    } else if (notif.object == self.fatherNameField) {
        if (self.fatherNameField.text.length == 0) {
            self.fatherNameField.clearButtonMode = UITextFieldViewModeNever;
        }
        else {
            self.fatherNameField.clearButtonMode = UITextFieldViewModeAlways;
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == self.tckNoTextField) {
        NSString* replacedString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"ShowQueryResult"]) {
        SecmenTabBarViewController *secmenTabBarViewController = [segue destinationViewController];
        secmenTabBarViewController.voter = currentVoter;
    }
    
    [self.tckNoTextField resignFirstResponder];
}

- (IBAction)performQuery:(id)sender {
    
    long long int myText = [self.tckNoTextField.text longLongValue];
    NSString *tck = [NSString stringWithFormat:@"%llu",myText];
    NSString* fatherName = self.fatherNameField.text;
    if ([tck length] == 11){
        
        if (fatherName != nil && ![fatherName isEqualToString:@""]) {
            self.loadingAlert = [[UIAlertView alloc] initWithTitle:@"Lütfen Bekleyiniz." message:@"Seçmen bilgileriniz yükleniyor.." delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
            UIActivityIndicatorView *myIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            myIndicator.hidesWhenStopped = YES;
            [self.loadingAlert addSubview:myIndicator];
            [self.loadingAlert show];
            myIndicator.frame = CGRectMake(110, 64, 60, 60);
            [myIndicator startAnimating];
            
            [[APIManager sharedInstance] getVoterWithTckNo:tck andFatherName:fatherName onCompletion:^(Voter *voter) {
                [self dismissLoadingView];
                currentVoter = voter;
                [self performSegueWithIdentifier:@"ShowQueryResult" sender:self];
            } onError:^(NSError *error) {
                [self dismissLoadingView];
                UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"Hata"
                                                                  message:[error localizedDescription]
                                                                 delegate:self
                                                        cancelButtonTitle:@"Tamam"
                                                        otherButtonTitles:nil, nil];
                [myAlert show];
            }];
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hata" message:@"Lütfen baba adınızı giriniz." delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hata" message:@"Lütfen 11 haneli T.C. Kimlik numaranızı giriniz." delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
        [alertView show];
    }
}
-(void)dismissLoadingView {
    [self.loadingAlert dismissWithClickedButtonIndex:-1 animated:YES];
}
- (void)viewDidUnload {
    [self setTckNoTextField:nil];
    [self setFatherNameField:nil];
    [super viewDidUnload];
}
@end