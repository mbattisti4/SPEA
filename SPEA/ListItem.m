//
//  ListItem.m
//  SPEA
//
//  Created by Marco Battisti on 19/01/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//



#import "ListItem.h"

@implementation ListItem
@synthesize liID;
@synthesize nome;
@synthesize descrizione;
@synthesize immagine;
@synthesize HasSons;

- (id)initWithName:(NSString *)pName descrizione:(NSString *)pDescrizione
{
    self = [super init];
    if (self)
    {
        nome = [[NSString alloc]initWithString:pName];
        descrizione = [[NSString alloc]initWithString:pDescrizione];
    }
    return self;
}


@end


