//
//  Competition.m
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-03.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Competition.h"

@implementation Competition



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
    NSLog(@"ok2");
    Athlete* unAthlete = [[Athlete alloc] initWithPrenomNomPaysNumero:pPrenom :pNom :pPays :unNombre];
    NSLog(@"%@%@%@", pNom, pPrenom, pPays);
    [lstAthlete addObject:unAthlete];
    
}

-(NSArray *)getLstAthlete
{
    return lstAthlete;
}

-(int)nouveauNumeroAthlete
{
    int unNombre;

    if([lstAthlete count]==0){
        unNombre = (int)arc4random() % 100 + 1;
        if(unNombre <0)
            unNombre = unNombre * -1;
    } else {
        bool quitte = false;

        while(!quitte)
        {
            unNombre = (int)arc4random() % 100 + 1;
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

@end
