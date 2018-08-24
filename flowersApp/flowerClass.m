//
//  flowerClass.m
//  flowersApp
//
//  Created by Admin on 7/11/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "flowerClass.h"
#import "FlowersData.h"
@implementation flowerClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        self=[super init];
    }
    return self;
}

-(id) initWithData : (NSDictionary *) data andImage:(UIImage*)image {
    
    self.flowerName=data[FLOWER_NAME];
    self.flowerCountry=data[FLOWER_COUNTRY];
    self.flowerOrigin=data[FLOWER_ORIGIN];
    self.flowerPeriod=[data[FLOWER_GROWTH_PERIOD] intValue];
   // NSString *imageName=[NSString stringWithFormat:@"images/%@.jpeg",self.flowerName];
    self.flowerImage= image;

    return self;
}



@end
