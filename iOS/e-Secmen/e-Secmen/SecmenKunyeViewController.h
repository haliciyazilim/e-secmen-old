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
@property (weak, nonatomic) IBOutlet UILabel *schoolLabel;
@property (weak, nonatomic) IBOutlet UILabel *chestLabel;

@property (weak, nonatomic) IBOutlet UITableViewCell *nameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *provinceCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *schoolCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *chestCell;

@property (weak, nonatomic) IBOutlet UITableViewCell *detailNameCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *detailProvinceCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *detailSchoolCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *detailChestCell;

@property (weak, nonatomic) IBOutlet UITableViewCell *firstEmptyRow;
@property (weak, nonatomic) IBOutlet UITableViewCell *secondEmptyRow;
@property (weak, nonatomic) IBOutlet UITableViewCell *thirdEmptyRow;
@property (weak, nonatomic) IBOutlet UITableViewCell *fourthEmptyRow;



- (void)setIsFirst;

@end
