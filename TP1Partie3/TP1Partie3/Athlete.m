//
//  Athlete.m
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Athlete.h"

@implementation Athlete

@synthesize pays;
@synthesize prenom;
@synthesize nom;
@synthesize position;
@synthesize numero;
@synthesize pointage;
@synthesize temps;

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(id)initWithPrenomNomPaysNumero: (NSString *)pPrenom: (NSString *)pNom: (NSString *)pPays: (int)pNumero{
    self = [super init];
    if (self){
        [self setPrenom:pPrenom];
        [self setNom:pNom];
        [self setPays:pPays];
        [self setNumero:pNumero];
        [self setPointage:0];
        [self setPosition:0];
        [self setTemps:0];
        
    }
    return self;
}

@end
