//
//  FirstViewController.m
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController
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
        
        
        UITabBarController *tabBarController = (UITabBarController *)self.parentViewController;
        NSArray *tabItems = [tabBarController.tabBar items];
        UIBarItem *item = (UIBarItem *)[tabItems objectAtIndex:1];
        [item setEnabled:YES];
        
        
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
	return [[[Competition laCompetition] getLstAthlete] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section

{
    return @"Athlètes inscrits à la compétition";
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];

    Athlete * athlete = [[[Competition laCompetition] getLstAthlete] objectAtIndex:[indexPath row]];
    
    
    UILabel *label;
    
    label = (UILabel *)[cell viewWithTag:1];
    label.text = [NSString stringWithFormat:@"%d", [athlete numero]];
    
    label = (UILabel *)[cell viewWithTag:2];
    label.text = [athlete prenom];
    
    label = (UILabel *)[cell viewWithTag:3];
    label.text = [athlete nom];
    
    label = (UILabel *)[cell viewWithTag:4];
    label.text = [athlete pays];
    
    return cell;
}

- (IBAction)btnDemarrerClick:(id)sender {
    
    int count = [[[Competition laCompetition] getLstAthlete] count];
    
    if(count==0){
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Vous devez ajouter un moins un athlète avant de démarrer la compétition."
                              message:nil
                              delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
        [alert show];
    } else {
        UITabBarController *tabBarController = (UITabBarController *)self.parentViewController;
        [tabBarController setSelectedIndex:1];
    }
    
}
@end
