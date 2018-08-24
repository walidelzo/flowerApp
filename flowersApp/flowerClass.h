//
//  flowerClass.h
//  flowersApp
//
//  Created by Admin on 7/11/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface flowerClass : NSObject
@property (strong ,nonatomic ) NSString * flowerName;
@property(strong,nonatomic) NSString * flowerCountry;
@property (strong,nonatomic) NSString *flowerOrigin;
@property (nonatomic) int flowerPeriod;
@property (strong,nonatomic) UIImage *flowerImage;
-(id) initWithData : (NSDictionary *) data andImage:(UIImage*)image ;
@end
