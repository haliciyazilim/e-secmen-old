//
//  Voter.m
//  e-Sandik
//
//  Created by Alperen Kavun on 08.11.2012.
//  Copyright (c) 2012 Halıcı. All rights reserved.
//

#import "Voter.h"
#import "Neighbour.h"

@implementation Voter

+ (id) voterFromDictionary:(NSDictionary *)aDictionary {
    return [[Voter alloc] initFromDictionary:aDictionary];
}

- (id) initFromDictionary:(NSDictionary *)aDictionary {
    if(self = [super init]) {
        
        NSDictionary *kunyeDictionary = [aDictionary objectForKey:@"KisiBilgileri"];
        NSArray *homeArray = [aDictionary objectForKey:@"AyniAdresteOyKullananlar"];
        NSArray *buildingArray = [aDictionary objectForKey:@"AyniBinadaOyKullananlar"];
        
        _name = [kunyeDictionary objectForKey:@"AdSoyad"];
        _province = [NSString stringWithFormat:@"%@ %@ %@", [kunyeDictionary objectForKey:@"Il"], [kunyeDictionary objectForKey:@"Ilce"], [kunyeDictionary objectForKey:@"Muhtarlik"]];
        
        NSMutableArray *fellowsInBuildingArray = [NSMutableArray array];
        
        for (NSDictionary *fellow in buildingArray) {
            [fellowsInBuildingArray addObject:[Neighbour neighbourFromDictionary:fellow]];
        }
        
        [fellowsInBuildingArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            int doorNumber1 = [((Neighbour*)obj1).doorNumber integerValue];
            int doorNumber2 = [((Neighbour*)obj2).doorNumber integerValue];
            
            if (doorNumber1 <= doorNumber2) {
                return NSOrderedAscending;
            } else {
                return NSOrderedDescending;
            }
        }];
        
        _fellowsInBuilding = fellowsInBuildingArray;
        
        NSMutableArray* fellowsInHome = [NSMutableArray array];
        
        for (NSDictionary* fellow in homeArray) {
            [fellowsInHome addObject:[Neighbour neighbourFromDictionary:fellow]];
        }
        
        [fellowsInHome sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            int doorNumber1 = [((Neighbour*)obj1).doorNumber integerValue];
            int doorNumber2 = [((Neighbour*)obj2).doorNumber integerValue];
            
            if (doorNumber1 <= doorNumber2) {
                return NSOrderedAscending;
            } else {
                return NSOrderedDescending;
            }
        }];
        
        _fellowsInHouse = fellowsInHome;
        
        return self;
    }
    
    return nil;
}

@end
