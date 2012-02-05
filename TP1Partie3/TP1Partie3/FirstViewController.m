//
//  FirstViewController.m
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController
@synthesize btnDemarrer;
@synthesize btnAjouter;
@synthesize txtPays;
@synthesize txtNom;
@synthesize txtPrenom;
@synthesize tableViewAthlete;


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
    
    UITabBarController *tabBarController = (UITabBarController *)self.parentViewController;
    NSArray *tabItems = [tabBarController.tabBar items];
    UIBarItem *item = (UIBarItem *)[tabItems objectAtIndex:1];
    [item setEnabled:NO];
    item = (UIBarItem *)[tabItems objectAtIndex:2];
    [item setEnabled:NO];
}

- (void)viewDidUnload
{
    [self setTxtPays:nil];
    [self setTxtNom:nil];
    [self setTxtPrenom:nil];
    [self setTableViewAthlete:nil];
    [self setBtnDemarrer:nil];
    [self setBtnAjouter:nil];
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

- (IBAction)addAthlete:(id)sender {
    
    if(txtPrenom.text.length > 0 && txtNom.text.length > 0 && txtPays.text.length > 0){
        [[Competition laCompetition] ajouterAthlete:txtPrenom.text: txtNom.text: txtPays.text];
        txtPays.text = @"";
        txtNom.text = @"";
        txtPrenom.text = @"";
        
        
        
        
        
        [tableViewAthlete reloadData];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Veuillez remplir tous les champs pour ajouter un athlète."
                              message:nil
                              delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
        [alert show];
    }
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    
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
        Athlete * athlete = [[[Competition laCompetition] getLstAthlete] objectAtIndex:[indexPath row]-1];
        
        
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Débuter"])
    {
        
        [btnAjouter setEnabled:NO];
        [btnDemarrer setEnabled:NO];
        [txtNom setEnabled:NO];
        [txtPays setEnabled:NO];
        [txtPrenom setEnabled:NO];
        
        
        UITabBarController *tabBarController = (UITabBarController *)self.parentViewController;
        NSArray *tabItems = [tabBarController.tabBar items];
        UIBarItem *item = (UIBarItem *)[tabItems objectAtIndex:1];
        [item setEnabled:YES];
        item = (UIBarItem *)[tabItems objectAtIndex:2];
        [item setEnabled:YES];
        
        [tabBarController setSelectedIndex:1];
    }
}



- (IBAction)btnDemarrerClick:(id)sender {
    
    int count = [[[Competition laCompetition] getLstAthlete] count];
    
    if(count==0){
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Vous devez ajouter au moins un athlète avant de démarrer la compétition."
                              message:nil
                              delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Si vous décidez de débuter la compétion, vous ne pourrez plus ajouter d'athlète."
                              message:nil
                              delegate:self
                              cancelButtonTitle:@"Ne pas débuter"
                              otherButtonTitles:@"Débuter", nil];
        [alert show];
        
    }
    
}
@end
