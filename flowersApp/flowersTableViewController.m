//
//  flowersTableViewController.m
//  flowersApp
//
//  Created by Admin on 7/11/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "flowersTableViewController.h"
#import "FlowersData.h"
@interface flowersTableViewController ()
@property (strong,nonatomic) NSMutableArray *myflowers;
@property (strong ,nonatomic) flowerClass *flowerclasss;
@property (strong,nonatomic) NSMutableArray *Flowersnew;



@end

@implementation flowersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
      self.myflowers=[[NSMutableArray alloc]init];
    
    for (NSMutableDictionary *flower in [FlowersData allFlowerData]) {
        self.flowerclasss  =[[flowerClass alloc]initWithData:flower];
        [self.myflowers addObject:self.flowerclasss];
        
    }
  
     // NSLog(@"%@",self.myflowers);
}

#pragma  mark - lazy instanstion

-(NSMutableArray*)Flowersnew{
    if (!_Flowersnew)
    {
        _Flowersnew=[[NSMutableArray alloc]init];
    }
    
    return _Flowersnew;
}







#pragma  mark - add flower delegate
-(void)addFlower:(flowerClass *)flower{
   // _Flowersnew=[[NSMutableArray alloc]init];
    [_Flowersnew addObject:flower];
    NSLog(@"add flower is : %lu",[_Flowersnew count]);
   
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
        cell.imageView.image=flow2.flowerImage;
       NSLog(@"%@",[_Flowersnew objectAtIndex:indexPath.row]);
    
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





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
