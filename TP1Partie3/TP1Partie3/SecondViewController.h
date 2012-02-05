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
{
    bool isDescente;
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnDemarrer;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnDNF;
- (IBAction)demarrerClick:(id)sender;
- (IBAction)dnfClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblCourant;
@property (weak, nonatomic) IBOutlet UITableView *lstAttente;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirmer;
@property (weak, nonatomic) IBOutlet UITextField *txtJuge1;
@property (weak, nonatomic) IBOutlet UITextField *txtJuge2;
@property (weak, nonatomic) IBOutlet UITextField *txtJuge3;
@property (weak, nonatomic) IBOutlet UITextField *txtJuge4;
@property (weak, nonatomic) IBOutlet UITextField *txtJuge5;
@property (weak, nonatomic) IBOutlet UITextField *txtJuge6;
@property (weak, nonatomic) IBOutlet UITextField *txtJuge7;

- (IBAction)continuerClick:(id)sender;



@end
