//
//  Competition.m
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Competition.h"

@implementation Competition

static Competition* _competition = nil;

+(Competition*)laCompetition
{
    @synchronized([Competition class])
    {
        if(!_competition)
            [[self alloc] init];
        
        return _competition;
    }
}

+(id)alloc
{
    @synchronized([_competition class])
    {
        NSAssert(_competition == nil, @"Essaye de créer un autre instance");
        _competition = [super alloc];
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

-(NSArray *)getLstAthlete
{
    return lstAthlete;
}

-(int)nouveauNumeroAthlete
{
    bool quitte = false;
    int unNombre;
    while(!quitte)
    {
        unNombre = (int)arc4random() * 100 + 1;
        for(Athlete* unAthlete in lstAthlete)
        {
            if((int)[unAthlete numero] == (int)unNombre)
            {
                break;
            }
            quitte = true;
        }
    }
    return unNombre;
}

@end
