//
//  Voter.h
//  e-Sandik
//
//  Created by Alperen Kavun on 08.11.2012.
//  Copyright (c) 2012 Halıcı. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Voter : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* province;
@property (nonatomic, strong) NSString* district;
@property (nonatomic, strong) NSArray* fellowsInBuilding;
@property (nonatomic, strong) NSArray* fellowsInHouse;
@property (nonatomic, strong) NSString *electionYear;

+ (id) voterFromDictionary:(NSDictionary *)aDictionary;

- (id) initFromDictionary:(NSDictionary *)aDictionary;

@end
