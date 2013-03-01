//
//  Document.m
//  SPEA
//
//  Created by Marco Battisti on 01/03/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import "Document.h"

@implementation Document
@synthesize ID;
@synthesize nome;
@synthesize aListaSistemi;

- (id)initWithName:(NSString *)pName ID:(NSString *)pID
{
    self = [super init];
    if (self)
    {
        nome = [[NSString alloc]initWithString:pName];
        ID = pID;
        //descrizione = [[NSString alloc]initWithString:pDescrizione];
    }
    return self;
}
@end
