//
//  SecmenTabBarViewController.h
//  e-Secmen
//
//  Created by Alperen Kavun on 08.07.2013.
//  Copyright (c) 2013 halici. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Voter;

@interface SecmenTabBarViewController : UITabBarController <UIAlertViewDelegate>

@property (nonatomic, strong) Voter* voter;

@end
