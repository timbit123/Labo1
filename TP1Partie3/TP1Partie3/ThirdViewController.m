//
//  SecondViewController.m
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ThirdViewController.h"

@implementation ThirdViewController
@synthesize lblMedailles;
@synthesize lstPositions;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLstPositions:nil];
    [self setLblMedailles:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [lstPositions reloadData];
    
    if([[Competition laCompetition] getAthleteCourant]==nil){
        
        NSMutableArray *or = [NSMutableArray arrayWithCapacity:3];
        NSMutableArray *argent = [NSMutableArray arrayWithCapacity:3];
        NSMutableArray *bronze = [NSMutableArray arrayWithCapacity:3];
        Athlete * athlete = nil;
        
        int cpt = 0;
        for(id obj in [[Competition laCompetition] getLstAthletePosition]){
            if(cpt==3){
                break;
            }
            athlete = (Athlete *)obj;
            if([athlete position]==1){
                [or addObject:athlete];
                cpt++;
            } else if([athlete position]==2){
                [argent addObject:athlete];
                cpt++;
            } else if([athlete position]==3){
                [bronze addObject:athlete];
                cpt++;
            }
        }
        
        
        NSMutableString *medailles = [NSMutableString stringWithString:@""];
        for(id obj in or){
            athlete = (Athlete *)obj;
            [medailles appendString:[NSString stringWithFormat: @"OR : %d %@ %@\n", [athlete numero], [athlete prenom], [athlete nom]]];
        }
        
        for(id obj in argent){
            athlete = (Athlete *)obj;
            [medailles appendString:[NSString stringWithFormat: @"ARGENT : %d %@ %@\n", [athlete numero], [athlete prenom], [athlete nom]]];
        }
        
        for(id obj in bronze){
            athlete = (Athlete *)obj;
            [medailles appendString:[NSString stringWithFormat: @"BRONZE : %d %@ %@\n", [athlete numero], [athlete prenom], [athlete nom]]];
        }
        
        
        
        
        [lblMedailles setText:medailles];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[[Competition laCompetition] getLstAthletePosition] count]+1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell3"];
    
    if([indexPath row]==0){
        UILabel *label;
        
        label = (UILabel *)[cell viewWithTag:1];
        
        label.text = @"Position";
        label.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
        
        label = (UILabel *)[cell viewWithTag:2];
        label.text = @"#";
        label.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
        
        label = (UILabel *)[cell viewWithTag:3];
        label.text = @"Prénom";
        label.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
        
        label = (UILabel *)[cell viewWithTag:4];
        label.text = @"Nom";
        label.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
        
        label = (UILabel *)[cell viewWithTag:5];
        label.text = @"Pays";
        label.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
        
        label = (UILabel *)[cell viewWithTag:6];
        label.text = @"Points";
        label.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];

    } else {
        Athlete * athlete = [[[Competition laCompetition] getLstAthletePosition] objectAtIndex:[indexPath row]-1];
        
        
        UILabel *label;
        
        if([athlete position]==-1){
            label = (UILabel *)[cell viewWithTag:1];
            label.text = @"DNF";
        } else {
            label = (UILabel *)[cell viewWithTag:1];
            label.text = [NSString stringWithFormat:@"%d", [athlete position]];
        }
        
        
        
        label = (UILabel *)[cell viewWithTag:2];
        label.text = [NSString stringWithFormat:@"%d", [athlete numero]];
        
        label = (UILabel *)[cell viewWithTag:3];
        label.text = [athlete prenom];
        
        label = (UILabel *)[cell viewWithTag:4];
        label.text = [athlete nom];
        
        label = (UILabel *)[cell viewWithTag:5];
        label.text = [athlete pays];
        
        label = (UILabel *)[cell viewWithTag:6];
        label.text = [NSString stringWithFormat:@"%.02f", [athlete pointage]];
    }
    return cell;
}
- (IBAction)retourClick:(id)sender {
    UITabBarController *tabBarController = (UITabBarController *)self.parentViewController;
    [tabBarController setSelectedIndex:1];
}
@end
