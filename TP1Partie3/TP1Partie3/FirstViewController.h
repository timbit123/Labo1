//
//  FirstViewController.h
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Competition.h"

@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (IBAction)addAthlete:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtPays;
@property (weak, nonatomic) IBOutlet UITextField *txtNom;
@property (weak, nonatomic) IBOutlet UITextField *txtPrenom;
@property (weak, nonatomic) IBOutlet UITableView *tableViewAthlete;
- (IBAction)btnDemarrerClick:(id)sender;

@end