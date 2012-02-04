//
//  Athlete.h
//  TP1Partie3
//
//  Created by Timothé Fillion Brunet on 12-02-01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Athlete : NSObject
{
    NSString* pays;
    NSString* prenom;
    NSString* nom;
    int position;
    int numero;
    double pointage;
    double temps;
}

-(id)initWithPrenomNomPaysNumero: (NSString *)pPrenom: (NSString *)pNom: (NSString *)pPays: (int)pNumero;

@property (retain) NSString* pays;
@property (retain) NSString* prenom;
@property (retain) NSString* nom;
@property int position;
@property int numero;
@property double pointage;
@property double temps;

@end
