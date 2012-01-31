//
//  main.m
//  TP1Partie2
//
//  Created by Alexandre Henry-Lebel on 12-01-29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


void AffichePathInfo(void);
void AfficheInfoProcessus(void);
void AfficheInfoSignets(void);
void AfficheInfoIntrospection(void);

///////////////////////////////
///////////////////////////////
// Affiche Path Info
///////////////////////////////
void AffichePathInfo() {
    NSString *path = @"~";
    NSString *newPath = [NSString stringWithFormat:@"Le répertoire home est '%@'", [path stringByResolvingSymlinksInPath]];
    NSLog(@"%@", newPath);
    NSArray *pathArr = [[path stringByResolvingSymlinksInPath] pathComponents];
    for(NSString *p in pathArr){
        NSLog(@"%@", p);
    }
}



///////////////////////////////
///////////////////////////////
// Affiche Info Processus
///////////////////////////////
void AfficheInfoProcessus(){
    NSProcessInfo * processInfo = [NSProcessInfo processInfo];
    NSLog(@"Name du processus courant: '%@' Process ID: '%d'", [processInfo processName],[processInfo processIdentifier]);
}



///////////////////////////////
///////////////////////////////
// Affiche Info Signets
///////////////////////////////
void AfficheInfoSignets(){
    NSMutableDictionary * dico = [[NSMutableDictionary alloc] init];
    [dico setObject:[NSURL URLWithString:@"http://www.etsmtl.ca"] forKey:@"École de technologie supérieure"];
	[dico setObject:[NSURL URLWithString:@"http://www.polymtl.ca"] forKey:@"École polytechnique de Montréal"];
	[dico setObject:[NSURL URLWithString:@"http://cours.logti.etsmtl.ca/log350/"] forKey:@"LOG350"];
    [dico setObject:[NSURL URLWithString:@"http://ville.montreal.qc.ca"] forKey:@"Ville de Montréal"];
    [dico setObject:[NSURL URLWithString:@"http://www.montrealenlumiere.com/"] forKey:@"Montréal en lumières"];
    [dico setObject:[NSURL URLWithString:@"http://www.petiteecole.com/"] forKey:@"La petite école"];
    
    for(NSString *cle in dico){
        if([[cle lowercaseString] hasPrefix:@"école"] || [[cle lowercaseString] hasSuffix:@"école"]){
             NSURL *url = [dico valueForKey:cle];
             NSLog(@"Clef: '%@' URL: '%@'", cle, [url absoluteString]);
        }
    }

}



///////////////////////////////
///////////////////////////////
// Affiche Info Introspection
///////////////////////////////
void AfficheInfoIntrospection(){
     NSMutableArray * arr = [[NSMutableArray alloc] init];
     [arr addObject:[NSString stringWithFormat:@"nsstring ordinaire"]];
     [arr addObject:@"une string constante"];
     [arr addObject:[NSMutableString stringWithFormat:@"mutable string"]];
     [arr addObject:[NSProcessInfo processInfo]];
     [arr addObject:[NSURL URLWithString:@"http://www.google.ca"]];
     [arr addObject:[[NSDictionary alloc] init]];
     
     for(id obj in arr){
          NSLog(@"Classe : %@", NSStringFromClass([obj class]));
          NSLog(@"Est Membre de NSString : %@", [obj isMemberOfClass:[NSString class]]?@"OUI":@"NON");
          NSLog(@"Une sorte de NSString : %@", [obj isKindOfClass:[NSString class]]?@"OUI":@"NON");
          NSLog(@"Respond a lowercaseString : %@", [obj respondsToSelector:@selector(lowercaseString)]?@"OUI":@"NON");
          if([obj respondsToSelector:@selector(lowercaseString)]){
               NSLog(@"lowercaseString is : %@", [obj lowercaseString]);
          }
          NSLog(@"========================================================");
     }

}




///////////////////////////////
///////////////////////////////
// Main
///////////////////////////////
int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    AffichePathInfo();
    AfficheInfoProcessus();
    AfficheInfoSignets();
    AfficheInfoIntrospection();
    [pool release];
    return 0;
}

