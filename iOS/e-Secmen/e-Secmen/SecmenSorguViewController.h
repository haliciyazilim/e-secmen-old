//
//  SecmenSorguViewController.h
//  e-Secmen
//
//  Created by Alperen Kavun on 05.07.2013.
//  Copyright (c) 2013 halici. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecmenSorguViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tckNoTextField;
@property (weak, nonatomic) IBOutlet UITextField *fatherNameField;
@property (nonatomic, strong) UIAlertView* loadingAlert;

- (IBAction)performQuery:(id)sender;
@end
