//
//  FlowersData.m
//  flowersApp
//
//  Created by Admin on 7/11/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "FlowersData.h"

@implementation FlowersData

+(NSArray *)allFlowerData{
    NSMutableArray *flower=[@[] mutableCopy];
  
    NSDictionary *flowerRed=@{ FLOWER_NAME :@"reda flower",FLOWER_COUNTRY : @"Japan",FLOWER_ORIGIN : @"Japanees",FLOWER_GROWTH_PERIOD :@366};
    [flower addObject:flowerRed];
    
    NSDictionary *flowerGreen=@{FLOWER_NAME:@"Greena flower",FLOWER_COUNTRY:@"Swedan",FLOWER_ORIGIN:@"scandinafian",FLOWER_GROWTH_PERIOD:@47};
    [flower addObject:flowerGreen];
    
    NSDictionary *flowerYellow=@{FLOWER_NAME:@"yellowena flower",FLOWER_COUNTRY:@"Egypt",FLOWER_GROWTH_PERIOD:@14};
    [flower addObject:flowerYellow];
    
    return [flower copy];
    
}

@end
