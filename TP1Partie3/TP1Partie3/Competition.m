//
//  Competition.m
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Competition.h"

@implementation Competition

@synthesize distancePiste;


+(Competition*)laCompetition
{
    static Competition* _competition = nil;
    
    @synchronized([Competition class])
    {
        if(!_competition)
            _competition = [[Competition alloc] init];
        
        return _competition;
    }
}

- (id)init {
    self = [super init];
    if (self) {
        lstAthlete = [[NSMutableArray alloc] init];
    }
    return self;
}



-(void)ajouterAthlete:(Athlete *)pUnAthlete
{
    [lstAthlete addObject:pUnAthlete];
}
-(void)ajouterAthlete:(NSString *)pPrenom :(NSString *)pNom :(NSString *)pPays
{
    
    int unNombre = (int)[self nouveauNumeroAthlete];
    Athlete* unAthlete = [[Athlete alloc] initWithPrenomNomPaysNumero:pPrenom :pNom :pPays :unNombre];
    [lstAthlete addObject:unAthlete];
    
}


-(void)setPointageAthleteCourant:(int)pPointageJuges :(double)pTemps
{
    
    if(pPointageJuges == -1)
    {
        //Joueurs DNF
        joueurCourant.position = -1;
        
    }else{
        //point des juge qui est 75% de 30 points
        double pointageJuge = ((double)pPointageJuges/35) * (30*0.75);
    
        //Speed = distance piste / 9.7m/s ceci donne le temps que le courseur doit faire pour avoir 75% de 7.5pts = 5.625
        double tempsRequit = (double)distancePiste / 9.7;
    
        //on fait le temps obtenu - le temps requit si > 0 on enleve des points, si < 0 on donne des points
        double differenceTemps = tempsRequit - pTemps;
    
        //pour les gars chaque .59 secondes fait varier la note de 0.2 sur une base de 5.625
        double pointsSpeed = (differenceTemps/0.59)*0.2 + 5.625;
    
        if (pointsSpeed < 0)
            pointsSpeed = 0;
        else if (pointsSpeed > 7.5)
            pointsSpeed = 7.5;
    
        //donne une note de 30 pts
        joueurCourant.pointage = pointageJuge + pointsSpeed;
    
        joueurCourant.temps = pTemps;
    }
    joueurCourant = nil;
}


-(Athlete *)getAthleteCourant
{
    NSArray * lstAthleteAttente = [self sortListAthleteAttente];
    if(lstAthleteAttente.count > 0)
    {
        joueurCourant = [lstAthleteAttente objectAtIndex:0];
    }
    return joueurCourant;
}


-(int)nouveauNumeroAthlete
{
    int unNombre;

    if([lstAthlete count]==0){
        unNombre = (int)(arc4random() % 100 + 1);
        if(unNombre <0)
            unNombre = unNombre * -1;
    } else {
        bool quitte = false;

        while(!quitte)
        {
            unNombre = (int)(arc4random() % 100 + 1);
            if(unNombre <0)
                unNombre = unNombre * -1;
            for(Athlete* unAthlete in lstAthlete)
            {
                if((int)[unAthlete numero] == (int)unNombre)
                {
                    break;
                }
                quitte = true;
            }
        }
    }
    
    return unNombre;
}



-(NSArray *)getLstAthlete
{
    return lstAthlete;
}


-(NSArray *)sortListAthleteAttente
{
    NSMutableArray * lstTempAthlete = [[NSMutableArray alloc] init];

    if(lstAthlete.count >0)
    {
        for (Athlete* athlete in lstAthlete) {
            if(athlete.pointage == 0)
                [lstTempAthlete addObject:athlete];
        }   
    }
    return lstTempAthlete;
}

-(NSMutableArray *)setPosition
{
    //on défini quesqu'on veut sorté
    NSSortDescriptor *sortPosition = [[NSSortDescriptor alloc] initWithKey:@"pointage" ascending:NO];
    
    //on créer une liste qui sera sorté avec l'ancienne liste
    NSMutableArray * sortedList = [[NSMutableArray alloc] initWithArray:lstAthlete];
    
    //on sort
    [sortedList sortUsingDescriptors:[NSArray arrayWithObject:sortPosition]];
    
    int position = 1;
    double lastPointage = 0;
    for (Athlete* athlete in sortedList) {
        if (athlete.pointage > 0 || athlete.position != -1) {
            if(lastPointage == athlete.pointage)
            {
                //Le joueurs a les même point que lautre joueur
                athlete.position = position -1;
                position++;
            }else
            {
                athlete.position = position;
                position++;
                lastPointage = athlete.pointage;
            }

        }
    }
    return sortedList;
}


-(NSArray *)sortListAthletePosition
{
    NSMutableArray * sortedListe = [self setPosition];
    for (Athlete* athlete in sortedListe) {
        if(athlete.position == 0)
            [sortedListe removeObject:athlete];
    }
    return sortedListe;
}
@end
