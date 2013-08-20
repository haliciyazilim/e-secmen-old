//
//  SecmenBinaBilgisiViewController.m
//  e-Secmen
//
//  Created by Alperen Kavun on 08.07.2013.
//  Copyright (c) 2013 halici. All rights reserved.
//

#import "SecmenBinaBilgisiViewController.h"

#import "Voter.h"
#import "Neighbour.h"

@interface SecmenBinaBilgisiViewController ()

@end

@implementation SecmenBinaBilgisiViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
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
    //    [self.tableView addSubview:imageView];
    
    // Set the background view of the table view
    self.tableView.backgroundView = imageView;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.topItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_binabilgisi.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}
- (void) viewDidAppear:(BOOL)animated
{
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [self.voter.fellowsInHouse count];
    } else {
        return [self.voter.fellowsInBuilding count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NeighbourCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Neighbour *neighBourAtIndex;
    
    if (indexPath.section == 0) {
        neighBourAtIndex = [self.voter.fellowsInHouse objectAtIndex:indexPath.row];
    } else {
        neighBourAtIndex = [self.voter.fellowsInBuilding objectAtIndex:indexPath.row];
    }
    
    [(UILabel *)[cell viewWithTag:1] setText:neighBourAtIndex.name];
    
    if ([neighBourAtIndex.doorNumber isEqualToString:@"0"]) {
        [(UILabel *)[cell viewWithTag:2] setText:@"-"];
    }
    else {
        [(UILabel *)[cell viewWithTag:2] setText:neighBourAtIndex.doorNumber];
    }
    
    return cell;
}

- (void)setVoter:(Voter *)voter {
    if (_voter != voter) {
        _voter = voter;
    }
    
    [self.tableView reloadData];
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    
    [headerView setBackgroundColor:[UIColor colorWithRed:0.420 green:0.227 blue:0.227 alpha:0.85]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, tableView.bounds.size.width - 10, 18)];

    if (section == 0) {
        label.text = @"Aynı adreste Oy Kullananlar             Kapı No";
    } else {
        label.text = @"Binanızda Oy Kullananlar                 Kapı No";
    }

    label.font = [UIFont fontWithName:@"Futura" size:14];
    label.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75];
    label.backgroundColor = [UIColor clearColor];
    [headerView addSubview:label];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 32;
}


@end
