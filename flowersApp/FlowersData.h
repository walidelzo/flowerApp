//
//  FlowersData.h
//  flowersApp
//
//  Created by Admin on 7/11/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FLOWER_NAME @"the flower name"
#define FLOWER_COUNTRY @"the country which flower farm"
#define FLOWER_ORIGIN  @"the origin of the folwer"
#define FLOWER_GROWTH_PERIOD @"the period flower to grows"




@interface FlowersData : NSObject
+(NSArray*)allFlowerData;
@end
