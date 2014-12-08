//
//  ViewController.h
//  Sample
//
//  Created by Koteswar on 13/11/14.
//  Copyright (c) 2014 Supreme-TechSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "service1.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableview;
- (IBAction)Fbpost:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageview2;
- (IBAction)chooseImg:(id)sender;
@property(strong, nonatomic) NSData *imagetoshare;
@property(strong, nonatomic)service1 *serv1;



@end
