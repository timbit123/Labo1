//
//  TP1Partie3Tests.m
//  TP1Partie3Tests
//
//  Created by Timothé Fillion Brunet on 12-02-01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TP1Partie3Tests.h"

@implementation TP1Partie3Tests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    NSLog(@"---------------------------------------------------");
    NSLog(@"---------------------------------------------------");
    NSLog(@"Liste joueur entrée");
    NSLog(@"---------------------------------------------------");
    Competition * competition = [Competition laCompetition];
    //piste de 300 metre
    [competition setDistancePiste:300];
    [competition ajouterAthlete: @"Timothé": @"Fillion": @"Canada"];
    [competition ajouterAthlete: @"Alexandre": @"Fillion": @"USA"];
    [competition ajouterAthlete: @"Marilou": @"Fillion": @"France"];
    [competition ajouterAthlete: @"Caroline": @"Séguin": @"Argentine"];
    [competition ajouterAthlete: @"Lorraine": @"Fillion": @"Russie"];
    [competition ajouterAthlete: @"Maxime": @"Longtin": @"Chine"];
    [competition ajouterAthlete: @"Guillaume": @"Longtin": @"Japon"];
    [competition ajouterAthlete: @"Richard": @"Longtin": @"Canada"];
    
    for (Athlete * athlete in [competition getLstAthlete]) {
        NSLog(@"%@ : %@ : %@ : %d : %f : %d", athlete.prenom, athlete.nom, athlete.pays, athlete.numero, athlete.pointage, athlete.position);
    }
    
    NSLog(@"---------------------------------------------------");
    NSLog(@"---------------------------------------------------");
    NSLog(@"Liste joueur en attente");
    NSLog(@"---------------------------------------------------");
    
    for (Athlete* athlete in [competition getLstAthleteAttente]) {
        NSLog(@"%@ : %@ : %@ : %d : %f : %d", athlete.prenom, athlete.nom, athlete.pays, athlete.numero, athlete.pointage, athlete.position);
    }
    
    NSLog(@"---------------------------------------------------");
    NSLog(@"---------------------------------------------------");
    NSLog(@"Athlete Courant");
    NSLog(@"---------------------------------------------------");
    
    Athlete* athleteCourant = [competition getAthleteCourant];
            NSLog(@"%@ : %@ : %@ : %d : %f : %d", athleteCourant.prenom, athleteCourant.nom, athleteCourant.pays, athleteCourant.numero, athleteCourant.pointage, athleteCourant.position);
    
    [competition setPointageAthleteCourant:32 :30.350f];
    
    NSLog(@"---------------------------------------------------");
    NSLog(@"---------------------------------------------------");
    NSLog(@"Athlete = au premier");
    NSLog(@"---------------------------------------------------");
    
    athleteCourant = [competition getAthleteCourant];
    NSLog(@"%@ : %@ : %@ : %d : %f : %d", athleteCourant.prenom, athleteCourant.nom, athleteCourant.pays, athleteCourant.numero, athleteCourant.pointage, athleteCourant.position);
    
    [competition setPointageAthleteCourant:32 :30.350f];
    
    NSLog(@"---------------------------------------------------");
    NSLog(@"---------------------------------------------------");
    NSLog(@"Troisième Athlete");
    NSLog(@"---------------------------------------------------");
    
    athleteCourant = [competition getAthleteCourant];
    NSLog(@"%@ : %@ : %@ : %d : %f : %d", athleteCourant.prenom, athleteCourant.nom, athleteCourant.pays, athleteCourant.numero, athleteCourant.pointage, athleteCourant.position);
    
    [competition setPointageAthleteCourant:-1 :46.87f];
    
    NSLog(@"---------------------------------------------------");
    NSLog(@"---------------------------------------------------");
    NSLog(@"QuatrièmeAthlete");
    NSLog(@"---------------------------------------------------");
    
    athleteCourant = [competition getAthleteCourant];
    NSLog(@"%@ : %@ : %@ : %d : %f : %d", athleteCourant.prenom, athleteCourant.nom, athleteCourant.pays, athleteCourant.numero, athleteCourant.pointage, athleteCourant.position);
    
    [competition setPointageAthleteCourant:12 :50.234];
    
    NSLog(@"---------------------------------------------------");
    NSLog(@"---------------------------------------------------");
    NSLog(@"Cinquième Athlete");
    NSLog(@"---------------------------------------------------");
    
    athleteCourant = [competition getAthleteCourant];
    NSLog(@"%@ : %@ : %@ : %d : %f : %d", athleteCourant.prenom, athleteCourant.nom, athleteCourant.pays, athleteCourant.numero, athleteCourant.pointage, athleteCourant.position);
    
    [competition setPointageAthleteCourant:31 :33.234f];
    
    
    NSLog(@"---------------------------------------------------");
    NSLog(@"---------------------------------------------------");
    NSLog(@"Sixième Athlete");
    NSLog(@"---------------------------------------------------");
    
    athleteCourant = [competition getAthleteCourant];
    NSLog(@"%@ : %@ : %@ : %d : %f : %d", athleteCourant.prenom, athleteCourant.nom, athleteCourant.pays, athleteCourant.numero, athleteCourant.pointage, athleteCourant.position);
    
    [competition setPointageAthleteCourant:15 :89.986f];
    
    NSLog(@"---------------------------------------------------");
    NSLog(@"---------------------------------------------------");
    NSLog(@"Ceptième Athlete");
    NSLog(@"---------------------------------------------------");
    
    athleteCourant = [competition getAthleteCourant];
    NSLog(@"%@ : %@ : %@ : %d : %f : %d", athleteCourant.prenom, athleteCourant.nom, athleteCourant.pays, athleteCourant.numero, athleteCourant.pointage, athleteCourant.position);
    
    [competition setPointageAthleteCourant:35 : 30.928f];
    
    NSLog(@"---------------------------------------------------");
    NSLog(@"---------------------------------------------------");
    NSLog(@"Liste joueur en attente");
    NSLog(@"---------------------------------------------------");
    
    for (Athlete* athlete in [competition getLstAthleteAttente]) {
        NSLog(@"%@ : %@ : %@ : %d : %f : %d", athlete.prenom, athlete.nom, athlete.pays, athlete.numero, athlete.pointage, athlete.position);
    }
    
    NSLog(@"---------------------------------------------------");
    NSLog(@"---------------------------------------------------");
    NSLog(@"Liste position");
    NSLog(@"---------------------------------------------------");
    
    for (Athlete* athlete in [competition getLstAthletePosition]) {
        NSLog(@"%@ : %@ : %@ : %d : %f : %d", athlete.prenom, athlete.nom, athlete.pays, athlete.numero, athlete.pointage, athlete.position);
    }
    
    
    
}

@end
