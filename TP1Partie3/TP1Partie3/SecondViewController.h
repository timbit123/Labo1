//
//  SecondViewController.h
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Competition.h"

@interface SecondViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnDemarrer;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnDNF;
- (IBAction)demarrerClick:(id)sender;
- (IBAction)dnfClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblCourant;

@end
