//
//  ViewController.m
//  Sample
//
//  Created by Koteswar on 13/11/14.
//  Copyright (c) 2014 Supreme-TechSolutions. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageview2,imagetoshare,serv1;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    serv1 = [[service1 alloc]init];
   
  

   
    _tableview.transform = CGAffineTransformMakeRotation(M_PI/-2);
    
   // [_tableview.layer setAnchorPoint:CGPointMake(0.0, 0.0)];
    _tableview.showsVerticalScrollIndicator = NO;
    
   // _tableview.showsVerticalScrollIndicator = NO;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 16;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:CellIdentifier];
        
          }
    
    cell.transform = CGAffineTransformMakeRotation(M_PI/2);
    // cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    [recipeImageView setBackgroundColor:[UIColor whiteColor]];
 
    recipeImageView.contentMode = UIViewContentModeScaleAspectFit;

   // recipeImageView.image = [UIImage imageWithData:data2];
    recipeImageView.image = [UIImage imageNamed:@"toppingTabselected.png"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"--------->%ld",(long)indexPath.row);
}

- (IBAction)Fbpost:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
   {
       SLComposeViewController *fbPostSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [fbPostSheet setInitialText:@"This is a my first Image to attach in Tweeter !"];
       [fbPostSheet addImage:[UIImage imageWithData:imagetoshare]];
      
       
        [self presentViewController:fbPostSheet animated:YES completion:nil];
}
   else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil];
        [alertView show];
    }

}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex ==1) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }
    if (buttonIndex ==2) {
        UIImagePickerController *images1 = [[UIImagePickerController alloc]init];
        images1.delegate = self;
        [self presentViewController:images1 animated:YES completion:nil];
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image2 = [info objectForKey:UIImagePickerControllerOriginalImage];
    imagetoshare = UIImageJPEGRepresentation(image2, 1.0);
    [imageview2 setImage:image2];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)chooseImg:(id)sender {
    
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Upload the image" message:nil delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:@"take Photo",@"Choose pic ", nil];
        alert.alertViewStyle = UIAlertViewStyleDefault;
        [alert show];

}

@end
