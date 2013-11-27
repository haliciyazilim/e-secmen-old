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
    [myImageView.layer setShouldRasterize:YES];
    [myImageView.layer setRasterizationScale:[UIScreen mainScreen].scale];
    myImageView.clipsToBounds = YES;
    
    UIImageView *myImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg.png"]];
    myImageView2.layer.cornerRadius = 6.0;
    [myImageView2.layer setShouldRasterize:YES];
    [myImageView2.layer setRasterizationScale:[UIScreen mainScreen].scale];
    myImageView2.clipsToBounds = YES;
    
    UIImageView *myImageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg.png"]];
    myImageView3.layer.cornerRadius = 6.0;
    [myImageView3.layer setShouldRasterize:YES];
    [myImageView3.layer setRasterizationScale:[UIScreen mainScreen].scale];
    myImageView3.clipsToBounds = YES;
    
    UIImageView *myImageView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_bg.png"]];
    myImageView4.layer.cornerRadius = 6.0;
    [myImageView4.layer setShouldRasterize:YES];
    [myImageView4.layer setRasterizationScale:[UIScreen mainScreen].scale];
    myImageView4.clipsToBounds = YES;
    
    UIImageView *myImageView5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_tile_bg.png"]];
    myImageView5.layer.cornerRadius = 6.0;
    [myImageView5.layer setShouldRasterize:YES];
    [myImageView5.layer setRasterizationScale:[UIScreen mainScreen].scale];
    myImageView5.clipsToBounds = YES;
    myImageView5.alpha = 0.3;
    
    UIImageView *myImageView6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_tile_bg.png"]];
    myImageView6.layer.cornerRadius = 6.0;
    [myImageView6.layer setShouldRasterize:YES];
    [myImageView6.layer setRasterizationScale:[UIScreen mainScreen].scale];
    myImageView6.clipsToBounds = YES;
    myImageView6.alpha = 0.3;
    
    UIImageView *myImageView7 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_tile_bg.png"]];
    myImageView7.layer.cornerRadius = 6.0;
    [myImageView7.layer setShouldRasterize:YES];
    [myImageView7.layer setRasterizationScale:[UIScreen mainScreen].scale];
    myImageView7.clipsToBounds = YES;
    myImageView7.alpha = 0.3;
    
    UIImageView *myImageView8 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_tile_bg.png"]];
    myImageView8.layer.cornerRadius = 6.0;
    [myImageView8.layer setShouldRasterize:YES];
    [myImageView8.layer setRasterizationScale:[UIScreen mainScreen].scale];
    myImageView8.clipsToBounds = YES;
    myImageView8.alpha = 0.3;

    
    self.nameCell.backgroundView = myImageView;
    self.provinceCell.backgroundView = myImageView2;
    self.schoolCell.backgroundView = myImageView3;
    self.chestCell.backgroundView = myImageView4;
    
    self.detailNameCell.backgroundView = myImageView5;
    self.detailProvinceCell.backgroundView = myImageView6;
    self.detailSchoolCell.backgroundView = myImageView7;
    self.detailChestCell.backgroundView = myImageView8;
    
    UIView *emptyView = [[UIView alloc] initWithFrame:CGRectZero];
    emptyView.backgroundColor = [UIColor clearColor];
    UIView *emptyView2 = [[UIView alloc] initWithFrame:CGRectZero];
    emptyView2.backgroundColor = [UIColor clearColor];
    UIView *emptyView3 = [[UIView alloc] initWithFrame:CGRectZero];
    emptyView3.backgroundColor = [UIColor clearColor];
    UIView *emptyView4 = [[UIView alloc] initWithFrame:CGRectZero];
    emptyView4.backgroundColor = [UIColor clearColor];
    
    self.firstEmptyRow.backgroundView = emptyView;
    self.secondEmptyRow.backgroundView = emptyView2;
    self.thirdEmptyRow.backgroundView = emptyView3;
    self.fourthEmptyRow.backgroundView = emptyView4;

    self.firstEmptyRow.backgroundView = emptyView;
    self.secondEmptyRow.backgroundView = emptyView2;
    
    [self configureViews];
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
    self.schoolLabel.text = self.voter.school;
    self.chestLabel.text = self.voter.chest;
    
    NSString* listDate = self.voter.listDate;
    
    UIFont* font = [UIFont fontWithName:@"Futura-Medium" size:13];
    
    NSString* infoString1 = [NSString stringWithFormat:@"%@ seçmen kütüğü bilgileri kullanılmaktadır. Eğer bu verilerde bir hata olduğunu düşünüyorsanız oturmakta olduğunuz ilçenin İLÇE NÜFUS MÜDÜRLÜĞÜ'ne başvurunuz.", listDate];
    
    CGSize labelSize1 = [infoString1 sizeWithFont:font constrainedToSize:CGSizeMake(300.0, 1000.0)];
    
    if (listDate != nil && ![listDate isEqualToString:@""]) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 10.0, 320.0, labelSize1.height+10.0)];
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 10.0, 300.0, labelSize1.height)];
        [headerLabel setBackgroundColor:[UIColor clearColor]];
        [headerLabel setTextColor:[UIColor whiteColor]];
        [headerLabel setFont:font];
        [headerLabel setAdjustsFontSizeToFitWidth:NO];
        [headerLabel setNumberOfLines:0];
        [headerLabel setTextAlignment:NSTextAlignmentCenter];
        [headerLabel setText:infoString1];
        [headerView addSubview:headerLabel];
        
        self.tableView.tableHeaderView = headerView;
    }

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
    [self setSchoolLabel:nil];
    [self setThirdEmptyRow:nil];
    [self setFourthEmptyRow:nil];
    [self setSchoolCell:nil];
    [self setChestCell:nil];
    [self setDetailSchoolCell:nil];
    [self setDetailChestCell:nil];
    [self setSchoolLabel:nil];
    [self setChestLabel:nil];
    [super viewDidUnload];
}
@end