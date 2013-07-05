//
//  SecmenNavigationViewController.m
//  e-Secmen
//
//  Created by Alperen Kavun on 05.07.2013.
//  Copyright (c) 2013 halici. All rights reserved.
//

#import "SecmenNavigationViewController.h"

@interface SecmenNavigationViewController ()

@end

@implementation SecmenNavigationViewController

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
    UINavigationBar *navBar = self.navigationBar;
    UIImage *image = [UIImage imageNamed:@"header_bg.png"];
    //    UIImage *shadowImage = [UIImage imageNamed:@"header_shadow.png"];
    
    [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    //    [navBar setShadowImage:shadowImage];
    
    UIImageView *shadowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"header_shadow.png"]];
    shadowView.frame = CGRectMake(0,navBar.frame.size.height+[UIApplication sharedApplication].statusBarFrame.size.height,323,17);
    [navBar.superview addSubview:shadowView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
