//
//  SecmenTabBarViewController.m
//  e-Secmen
//
//  Created by Alperen Kavun on 08.07.2013.
//  Copyright (c) 2013 halici. All rights reserved.
//

#import "SecmenTabBarViewController.h"

#import "SecmenKunyeViewController.h"
#import "SecmenBinaBilgisiViewController.h"

@interface SecmenTabBarViewController ()

@end

@implementation SecmenTabBarViewController

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
}

- (void)viewWillAppear:(BOOL)animated {
    
    UIImage *titleImage = [UIImage imageNamed:@"title_secmenkunyesi.png"];
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:titleImage];
    
    self.navigationItem.titleView = titleImageView;
    
    SecmenKunyeViewController *secmenKunyeViewController = [self.viewControllers objectAtIndex:0];
    [secmenKunyeViewController setIsFirst];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setVoter:(Voter *)voter {
    SecmenKunyeViewController *sandikKunyeViewController = [self.viewControllers objectAtIndex:0];
    sandikKunyeViewController.voter = voter;
    
    SecmenBinaBilgisiViewController *sandikBinaBilgisiViewController = [self.viewControllers objectAtIndex:1];
    sandikBinaBilgisiViewController.voter = voter;
}

@end
