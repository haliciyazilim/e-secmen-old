//
//  SecmenKunyeViewController.h
//  e-Secmen
//
//  Created by Alperen Kavun on 08.07.2013.
//  Copyright (c) 2013 halici. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Voter;

@interface SecmenKunyeViewController : UITableViewController
{
    int isFirst;
}

@property (strong, nonatomic) Voter *voter;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *provinceLabel;

@property (weak, nonatomic) IBOutlet UITableViewCell *nameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *provinceCell;

@property (weak, nonatomic) IBOutlet UITableViewCell *detailNameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *detailProvinceCell;

@property (weak, nonatomic) IBOutlet UITableViewCell *firstEmptyRow;
@property (weak, nonatomic) IBOutlet UITableViewCell *secondEmptyRow;



- (void)setIsFirst;

@end
