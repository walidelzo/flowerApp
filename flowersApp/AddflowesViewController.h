//
//  AddflowesViewController.h
//  flowersApp
//
//  Created by walidelzo on 8/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "flowerClass.h"

@protocol AddflowesViewControllerDelegte<NSObject>
@required
-(void)addFlower:(flowerClass *)flower;
-(void)getTextName:(NSString *)name;
-(void)DidCancel;
@end

@interface AddflowesViewController : UIViewController

@property (weak,nonatomic) id <AddflowesViewControllerDelegte> delegate;
@property (weak, nonatomic) IBOutlet UITextField *flowerNameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *flowerCountryTextField;
@property (weak, nonatomic) IBOutlet UITextField *flowerOriginTextField;
@property (weak, nonatomic) IBOutlet UITextField *flowerPeriodTextField;
- (IBAction)addButton:(UIButton *)sender;
- (IBAction)CancelButton:(UIButton *)sender;

@end
