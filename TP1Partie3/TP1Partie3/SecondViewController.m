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
@synthesize lstAttente;
@synthesize btnConfirmer;
@synthesize txtJuge1;
@synthesize txtJuge2;
@synthesize txtJuge3;
@synthesize txtJuge4;
@synthesize txtJuge5;
@synthesize txtJuge6;
@synthesize txtJuge7;
@synthesize lblTimer;
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
    isDescente = NO;
}

- (void)viewDidUnload
{
    [self setBtnDemarrer:nil];
    [self setBtnDNF:nil];
    [self setLblCourant:nil];
    [self setLstAttente:nil];
    [self setBtnConfirmer:nil];
    [self setTxtJuge1:nil];
    [self setTxtJuge2:nil];
    [self setTxtJuge3:nil];
    [self setTxtJuge4:nil];
    [self setTxtJuge5:nil];
    [self setTxtJuge6:nil];
    [self setTxtJuge7:nil];
    [self setLblTimer:nil];
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
	return [[[Competition laCompetition] getLstAthleteAttente] count]+1;
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
    if(isDescente){
        [btnDemarrer setTitle:@"Démarrer descente"];
        [btnDemarrer setEnabled:NO];
        [btnDNF setEnabled:NO];
        [btnConfirmer setEnabled:YES];
        isDescente = NO;
        
        [txtJuge1 setEnabled:YES];
        [txtJuge2 setEnabled:YES];
        [txtJuge3 setEnabled:YES];
        [txtJuge4 setEnabled:YES];
        [txtJuge5 setEnabled:YES];
        [txtJuge6 setEnabled:YES];
        [txtJuge7 setEnabled:YES];
        
        
        timePassed = [start timeIntervalSinceNow]*-1.0f;
        [lblTimer setText:[NSString stringWithFormat:@"%.02f s", timePassed]];
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"La descente est terminée. Veuillez entrer le résultat des juges."
                              message:nil
                              delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
        [alert show];
        
        
        
    } else {
        Athlete *courant = [[Competition laCompetition] getAthleteCourant];
        [lblCourant setText:[NSString stringWithFormat:@"#%d - %@ %@ du pays: %@", [courant numero], [courant prenom], [courant nom], [courant pays]]];
        [btnDemarrer setTitle:@"Fin de la descente"];
        [btnDNF setEnabled:YES];
        [lstAttente reloadData];
        [btnConfirmer setEnabled:NO];
        isDescente = YES;
        [lblTimer setText:@"Calcul en cours..."];
        [txtJuge1 setEnabled:NO];
        [txtJuge2 setEnabled:NO];
        [txtJuge3 setEnabled:NO];
        [txtJuge4 setEnabled:NO];
        [txtJuge5 setEnabled:NO];
        [txtJuge6 setEnabled:NO];
        [txtJuge7 setEnabled:NO];
        start = [NSDate date];
    }
    
}

- (IBAction)dnfClick:(id)sender {
    [[Competition laCompetition] setPointageAthleteCourant:-1 :1.0f];
    [btnDemarrer setTitle:@"Démarrer descente"];
    [btnDemarrer setEnabled:YES];
    [btnDNF setEnabled:NO];
    [btnConfirmer setEnabled:NO];
    isDescente = NO;
    
    [lblCourant setText:@"Aucun"];
    [lblTimer setText:@"DNF"];
    [txtJuge1 setEnabled:NO];
    [txtJuge2 setEnabled:NO];
    [txtJuge3 setEnabled:NO];
    [txtJuge4 setEnabled:NO];
    [txtJuge5 setEnabled:NO];
    [txtJuge6 setEnabled:NO];
    [txtJuge7 setEnabled:NO];
    
    if([[Competition laCompetition] getAthleteCourant]==nil){
        [btnDemarrer setEnabled:NO];
        [btnConfirmer setEnabled:NO];
        [txtJuge1 setEnabled:NO];
        [txtJuge2 setEnabled:NO];
        [txtJuge3 setEnabled:NO];
        [txtJuge4 setEnabled:NO];
        [txtJuge5 setEnabled:NO];
        [txtJuge6 setEnabled:NO];
        [txtJuge7 setEnabled:NO];
        
        
        [txtJuge1 setText:@""];
        [txtJuge2 setText:@""];
        [txtJuge3 setText:@""];
        [txtJuge4 setText:@""];
        [txtJuge5 setText:@""];
        [txtJuge6 setText:@""];
        [txtJuge7 setText:@""];
        
        [lblCourant setText:@"Compétition terminée"];
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"La compétition est terminée. Voulez-vous voir les résultats?"
                              message:nil
                              delegate:self
                              cancelButtonTitle:@"Non"
                              otherButtonTitles:@"Oui", nil];
        [alert show];
        
        
    }
}
- (IBAction)continuerClick:(id)sender {
    
    if(txtJuge1.text.length > 0 && txtJuge2.text.length > 0 && txtJuge3.text.length > 0 && txtJuge4.text.length > 0 && txtJuge5.text.length > 0 && txtJuge6.text.length > 0 && txtJuge7.text.length > 0){
        
        if([[NSScanner scannerWithString:txtJuge1.text] scanInt:NULL] && [[NSScanner scannerWithString:txtJuge2.text] scanInt:NULL] && [[NSScanner scannerWithString:txtJuge3.text] scanInt:NULL] && [[NSScanner scannerWithString:txtJuge1.text] scanInt:NULL] && [[NSScanner scannerWithString:txtJuge4.text] scanInt:NULL] && [[NSScanner scannerWithString:txtJuge5.text] scanInt:NULL] && [[NSScanner scannerWithString:txtJuge6.text] scanInt:NULL] && [[NSScanner scannerWithString:txtJuge7.text] scanInt:NULL]){
            int p1 = [txtJuge1.text intValue];
            int p2 = [txtJuge2.text intValue];
            int p3 = [txtJuge3.text intValue];
            int p4 = [txtJuge4.text intValue];
            int p5 = [txtJuge5.text intValue];
            int p6 = [txtJuge6.text intValue];
            int p7 = [txtJuge7.text intValue];
            
            if((p1>=0&&p1<=5)&&(p2>=0&&p2<=5)&&(p3>=0&&p3<=5)&&(p4>=0&&p4<=5)&&(p5>=0&&p5<=5)&&(p6>=0&&p6<=5)&&(p7>=0&&p7<=5)){
                //array, sort, enleve extremités
                NSArray *arr, *sorted;
                arr = [NSArray arrayWithObjects:[NSNumber numberWithInt:p1], [NSNumber numberWithInt:p2], [NSNumber numberWithInt:p3], [NSNumber numberWithInt:p4], [NSNumber numberWithInt:p5], [NSNumber numberWithInt:p6], [NSNumber numberWithInt:p7], nil];
                sorted = [arr sortedArrayUsingSelector:@selector(compare:)];
                
                int total = 0;
                for(int i = 1; i<=sorted.count-1; i++){
                    total += (int)[sorted objectAtIndex:i];
                }
                
                [[Competition laCompetition] setPointageAthleteCourant:total :timePassed];
                //SI DERNIER -> MÉDAILLE
                if([[Competition laCompetition] getAthleteCourant]==nil){
                    [btnDemarrer setEnabled:NO];
                    [btnConfirmer setEnabled:NO];
                    [txtJuge1 setEnabled:NO];
                    [txtJuge2 setEnabled:NO];
                    [txtJuge3 setEnabled:NO];
                    [txtJuge4 setEnabled:NO];
                    [txtJuge5 setEnabled:NO];
                    [txtJuge6 setEnabled:NO];
                    [txtJuge7 setEnabled:NO];
                    
                    
                    [txtJuge1 setText:@""];
                    [txtJuge2 setText:@""];
                    [txtJuge3 setText:@""];
                    [txtJuge4 setText:@""];
                    [txtJuge5 setText:@""];
                    [txtJuge6 setText:@""];
                    [txtJuge7 setText:@""];
                    
                    [lblCourant setText:@"Compétition terminée"];
                    
                    UIAlertView *alert = [[UIAlertView alloc]
                                          initWithTitle:@"La compétition est terminée. Voulez-vous voir les résultats?"
                                          message:nil
                                          delegate:self
                                          cancelButtonTitle:@"Non"
                                          otherButtonTitles:@"Oui", nil];
                    [alert show];
                    
                    
                } else {
                    [btnDemarrer setEnabled:YES];
                    [btnConfirmer setEnabled:NO];
                    [txtJuge1 setEnabled:NO];
                    [txtJuge2 setEnabled:NO];
                    [txtJuge3 setEnabled:NO];
                    [txtJuge4 setEnabled:NO];
                    [txtJuge5 setEnabled:NO];
                    [txtJuge6 setEnabled:NO];
                    [txtJuge7 setEnabled:NO];
                    
                    
                    [txtJuge1 setText:@""];
                    [txtJuge2 setText:@""];
                    [txtJuge3 setText:@""];
                    [txtJuge4 setText:@""];
                    [txtJuge5 setText:@""];
                    [txtJuge6 setText:@""];
                    [txtJuge7 setText:@""];
                    
                    [lblCourant setText:@"Aucun"];
                }
                
                
                
            } else {
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"Le résultat doit être un entier entre 0 et 5."
                                      message:nil
                                      delegate:nil
                                      cancelButtonTitle:nil
                                      otherButtonTitles:@"OK", nil];
                [alert show];
            }
        } else {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:@"Le résultat doit être un entier entre 0 et 5."
                                  message:nil
                                  delegate:nil
                                  cancelButtonTitle:nil
                                  otherButtonTitles:@"OK", nil];
            [alert show];
        
        }
    } else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Veuillez remplir tous les champs pour confirmer le pointage."
                              message:nil
                              delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Oui"])
    {
        UITabBarController *tabBarController = (UITabBarController *)self.parentViewController;
        [tabBarController setSelectedIndex:2];
    }
}
@end
