//
//  AddflowesViewController.m
//  flowersApp
//
//  Created by walidelzo on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "AddflowesViewController.h"

@interface AddflowesViewController ()

@end

@implementation AddflowesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */





- (IBAction)addButton:(UIButton *)sender {
    
    [ self.delegate addFlower:[self returnflower]];
    // [self.delegate getTextName:_flowerNameTextfield.text];
    
}

- (IBAction)CancelButton:(UIButton *)sender {
    [self.delegate DidCancel];
}

-(flowerClass *)returnflower{
    
    flowerClass *addedflower=[[flowerClass alloc]init ];
    addedflower.flowerName=_flowerNameTextfield.text;
    addedflower.flowerCountry=_flowerCountryTextField.text;
    addedflower.flowerOrigin=_flowerOriginTextField.text;
    addedflower.flowerPeriod=[_flowerPeriodTextField.text intValue];
    addedflower.flowerImage=[UIImage imageNamed:@"images/purpleFlower.jpg"];
    return addedflower;
}

@end
