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
}
+(Competition *)laCompetition;

-(NSArray *)getLstAthlete;
-(void)ajouterAthlete: (Athlete *)pUnAthlete;
-(void)ajouterAthlete: (NSString *)pPrenom: (NSString *)pNom: (NSString *)pPays;
-(int)nouveauNumeroAthlete;


@end

