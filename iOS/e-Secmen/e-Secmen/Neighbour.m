//
//  Neighbour.m
//  e-Sandik
//
//  Created by Alperen Kavun on 09.11.2012.
//  Copyright (c) 2012 Halıcı. All rights reserved.
//

#import "Neighbour.h"

@implementation Neighbour

+ (id) neighbourFromDictionary:(NSDictionary *)aDictionary {
    return [[Neighbour alloc] initWithDictionary:aDictionary];
}

- (id) initWithDictionary:(NSDictionary *)aDictionary {
    if(self = [super init]) {
        _name = [NSString stringWithFormat:@"%@ %@", [aDictionary objectForKey:@"Adi"], [aDictionary objectForKey:@"Soyadi"]];
        _doorNumber = [NSString stringWithFormat:@"%@", [aDictionary objectForKey:@"Daire"]];
        
        return self;
    }
    return nil;
}

@end
