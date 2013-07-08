//
//  SecmenKunyeViewController.m
//  e-Secmen
//
//  Created by Alperen Kavun on 08.07.2013.
//  Copyright (c) 2013 halici. All rights reserved.
//

#import "SecmenKunyeViewController.h"
#import "Voter.h"
#import <QuartzCore/QuartzCore.h>

@interface SecmenKunyeViewController ()

- (void)configureViews;

@end

@implementation SecmenKunyeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Yeni sorgu" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"mainbg.png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeBottom;
    
    // Add image view on top of table view
    
    // Set the background view of the table view
    self.tableView.backgroundView = imageView;
    
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    
    UIImageView *myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg.png"]];
    myImageView.layer.cornerRadius = 6.0;
    myImageView.clipsToBounds = YES;
    
    UIImageView *myImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg.png"]];
    myImageView2.layer.cornerRadius = 6.0;
    myImageView2.clipsToBounds = YES;
    
    UIImageView *myImageView5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_tile_bg.png"]];
    myImageView5.layer.cornerRadius = 6.0;
    myImageView5.clipsToBounds = YES;
    myImageView5.alpha = 0.3;
    
    UIImageView *myImageView6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_tile_bg.png"]];
    myImageView6.layer.cornerRadius = 6.0;
    myImageView6.clipsToBounds = YES;
    myImageView6.alpha = 0.3;

    
    self.nameCell.backgroundView = myImageView;
    self.provinceCell.backgroundView = myImageView2;
    
    self.detailNameCell.backgroundView = myImageView5;
    self.detailProvinceCell.backgroundView = myImageView6;
    
    UIView *emptyView = [[UIView alloc] initWithFrame:CGRectZero];
    emptyView.backgroundColor = [UIColor clearColor];
    UIView *emptyView2 = [[UIView alloc] initWithFrame:CGRectZero];
    emptyView2.backgroundColor = [UIColor clearColor];

    self.firstEmptyRow.backgroundView = emptyView;
    self.secondEmptyRow.backgroundView = emptyView2;
    
    [self configureViews];
}
- (void) configure {
    self.nameLabel.text = self.voter.name;
    self.provinceLabel.text = self.voter.province;
}
- (void)viewWillAppear:(BOOL)animated {
    
    if(isFirst != 0){
        
        self.navigationController.navigationBar.topItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_secmenkunyesi.png"]];
    }
    else{
        isFirst = 1;
    }
}
- (void) viewDidAppear:(BOOL)animated {
    [self configureViews];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setVoter:(Voter *)voter {
    if (_voter != voter) {
        _voter = voter;
    }
}

- (void)configureViews {
    self.nameLabel.text = self.voter.name;
    self.provinceLabel.text = self.voter.province;
}
- (void)setIsFirst {
    isFirst = 0;
}
- (void)viewDidUnload {
    [self setNameCell:nil];
    [self setProvinceCell:nil];
    [self setDetailNameCell:nil];
    [self setDetailProvinceCell:nil];
    [self setFirstEmptyRow:nil];
    [self setSecondEmptyRow:nil];
    [super viewDidUnload];
}
@end