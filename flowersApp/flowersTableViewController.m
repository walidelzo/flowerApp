//
//  flowersTableViewController.m
//  flowersApp
//
//  Created by Admin on 7/11/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "flowersTableViewController.h"
#import "FlowersData.h"
#define  FLOWER_ADDED_OBJECTS @"the key of flowers added "

@interface flowersTableViewController ()
@property (strong,nonatomic) NSMutableArray *myflowers;
@property (strong ,nonatomic) flowerClass *flowerclasss;
@property (strong,nonatomic) NSMutableArray *Flowersnew;



@end

@implementation flowersTableViewController
#pragma mark -Load View

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.myflowers=[[NSMutableArray alloc]init];
    
    for (NSMutableDictionary *flower in [FlowersData allFlowerData]) {
        NSString *imageName=[NSString stringWithFormat:@"images/%@.jpeg",flower[FLOWER_NAME]];
        UIImage *image=[UIImage imageNamed:imageName];
        self.flowerclasss  =[[flowerClass alloc]initWithData:flower andImage:image];
        [self.myflowers addObject:self.flowerclasss];
        
        
        
    }
    
    NSArray *flowerAsPlaylists=[[NSUserDefaults standardUserDefaults]arrayForKey:FLOWER_ADDED_OBJECTS];
    for (NSDictionary *dic in flowerAsPlaylists) {
        [self.Flowersnew addObject:[self flowerclasssForDictionary:dic]];
    }
    
    
}

#pragma  mark - lazy instanstion

-(NSMutableArray*)Flowersnew{
    if (!_Flowersnew)
    {
        _Flowersnew=[[NSMutableArray alloc]init];
    }
    
    return _Flowersnew;
}


#pragma mark -Helper Methods
-(NSDictionary *)flowerAsplaylist:(flowerClass *)flower{
    NSData *imageWithData=UIImagePNGRepresentation(flower.flowerImage);
    NSDictionary * dictionary=@{FLOWER_NAME:flower.flowerName,FLOWER_ORIGIN:flower.flowerOrigin,FLOWER_COUNTRY:flower.flowerCountry,FLOWER_GROWTH_PERIOD:@(flower.flowerPeriod),FLOWER_IMAGE:imageWithData};
    return dictionary;
}

-(flowerClass *)flowerclasssForDictionary :(NSDictionary *)dictionary{
    
    //NSString *imageName=[NSString stringWithFormat:@"images/%@.jpeg",dictionary[FLOWER_NAME]];
    UIImage *image=[UIImage imageWithData:dictionary[FLOWER_IMAGE]];
    flowerClass *flowerr=[[flowerClass alloc] initWithData:dictionary andImage:image];
    return flowerr;
    
}




#pragma  mark - add flower delegate
-(void)addFlower:(flowerClass *)flower{
    
    NSMutableArray *flowerAsplayLists=[[[NSUserDefaults standardUserDefaults]arrayForKey:FLOWER_ADDED_OBJECTS]mutableCopy];
    
    if (!flowerAsplayLists)flowerAsplayLists=[[NSMutableArray alloc]init];
    
    [flowerAsplayLists addObject:[self flowerAsplaylist:flower]];
    [[NSUserDefaults standardUserDefaults]setObject:flowerAsplayLists forKey:FLOWER_ADDED_OBJECTS];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    [self.Flowersnew addObject:flower];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}

-(void)getTextName:(NSString *)name{
    NSLog(@"%@",name);
}

-(void)DidCancel{
    
    NSLog(@"did cancel fired");
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (_Flowersnew){
        
        return 2;
        
    }else {
        
        return 1;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    if (section==0)
    {
        return [_myflowers count];
    }
    else
    {
        
        return [_Flowersnew count];
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flowerTable" forIndexPath:indexPath];
    
    
    if (indexPath.section==0){
        flowerClass *flow=[self.myflowers objectAtIndex:indexPath.row];
        cell.textLabel.text=flow.flowerName;
        cell.imageView.image=flow.flowerImage;
        cell.detailTextLabel.text=flow.flowerCountry;
        
    }else if(indexPath.section==1) {
        
        
        flowerClass *flow2=[_Flowersnew objectAtIndex:indexPath.row];
        cell.textLabel.text=flow2.flowerName;
        cell.detailTextLabel.text=flow2.flowerCountry;
        //UIImage *newFlowerImage=[UIImage imageWithData:flow2.flowerImage];
        cell.imageView.image=flow2.flowerImage;
        //NSLog(@"%@",flow2.flowerImage);
        
    }
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}


#pragma mark - Segue config

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if ([sender isKindOfClass:[UITableViewCell class]]){
        if ([segue.destinationViewController isKindOfClass:[DetailViewController class]]){
            
            DetailViewController *nextView=segue.destinationViewController;
            NSIndexPath *path=[self.tableView indexPathForCell:sender];
            
            
            if (path.section==0){
                flowerClass *flow = [self.myflowers objectAtIndex:path.row];
                nextView.imageFromOtherPriviousView=flow.flowerImage;
                // NSLog(@"%@",nextView.imageFromOtherPriviousView);
            }else{
                flowerClass *flow = [_Flowersnew objectAtIndex:path.row];
                nextView.imageFromOtherPriviousView=flow.flowerImage;
            }
            
        }
    }
    
    
    
    if ([segue.destinationViewController isKindOfClass:[AddflowesViewController class]]){
        AddflowesViewController *addflowersVC=segue.destinationViewController;
        addflowersVC.delegate=self;
    }
    
}






// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    if (indexPath.section==1)return YES;
    else return NO;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the row from the data source
        NSMutableArray  *newflowerAfterDelete=[[NSMutableArray alloc]init];
        
        [self.Flowersnew removeObjectAtIndex:indexPath.row];
        
        for (flowerClass *flower  in self.Flowersnew) {
            [newflowerAfterDelete addObject:[self flowerAsplaylist :flower]];
        }
        
        [[NSUserDefaults standardUserDefaults]setObject:newflowerAfterDelete forKey:FLOWER_ADDED_OBJECTS];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}



/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
