//
//  Competition.h
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Athlete.h"


//SINGLETON
@interface Competition : NSObject
{
    NSMutableArray * lstAthlete;
    Athlete * joueurCourant;
    int distancePiste;
}
+(Competition *)laCompetition;

@property int distancePiste;

-(void)ajouterAthlete: (Athlete *)pUnAthlete;
-(void)ajouterAthlete: (NSString *)pPrenom: (NSString *)pNom: (NSString *)pPays;
-(int)nouveauNumeroAthlete;
-(Athlete *)getAthleteCourant;
-(void)setPointageAthleteCourant:(int)pPointageJuges:(double)pTemps;
-(NSMutableArray *)setPosition;
-(NSArray *)getLstAthlete;
-(NSArray *)sortListAthleteAttente;
-(NSArray *)sortListAthletePosition;


@end

