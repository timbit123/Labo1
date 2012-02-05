//
//  SecondViewController.m
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController
@synthesize lblCourant;
@synthesize btnDemarrer;
@synthesize btnDNF;

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
    [self setBtnDemarrer:nil];
    [self setBtnDNF:nil];
    [self setLblCourant:nil];
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
	return [[[Competition laCompetition] getLstAthlete] count]+1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell2"];
    
    if([indexPath row]==0){
        UILabel *label;
        
        label = (UILabel *)[cell viewWithTag:1];
        label.text = @"#";
        label.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
        
        label = (UILabel *)[cell viewWithTag:2];
        label.text = @"Prénom";
        label.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
        
        label = (UILabel *)[cell viewWithTag:3];
        label.text = @"Nom";
        label.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
        
        label = (UILabel *)[cell viewWithTag:4];
        label.text = @"Pays";
        label.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:18];
    } else {
        Athlete * athlete = [[[Competition laCompetition] getLstAthleteAttente] objectAtIndex:[indexPath row]-1];
        
        
        UILabel *label;
        
        label = (UILabel *)[cell viewWithTag:1];
        label.text = [NSString stringWithFormat:@"%d", [athlete numero]];
        
        label = (UILabel *)[cell viewWithTag:2];
        label.text = [athlete prenom];
        
        label = (UILabel *)[cell viewWithTag:3];
        label.text = [athlete nom];
        
        label = (UILabel *)[cell viewWithTag:4];
        label.text = [athlete pays];
    }
    return cell;
}

- (IBAction)demarrerClick:(id)sender {
    Athlete *courant = [[Competition laCompetition] getAthleteCourant];
    [lblCourant setText:[NSString stringWithFormat:@"#%d - %@ %@ du pays: %@", [courant numero], [courant prenom], [courant nom], [courant pays]]];
    [btnDemarrer setTitle:@"Fin de la descente"];
}

- (IBAction)dnfClick:(id)sender {
}
@end
