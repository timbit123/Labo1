//
//  ThirdViewController.h
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Competition.h"
@interface ThirdViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
- (IBAction)retourClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblMedailles;
@property (weak, nonatomic) IBOutlet UITableView *lstPositions;
@end
