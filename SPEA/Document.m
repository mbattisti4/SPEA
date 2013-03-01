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
@synthesize immagine;
@synthesize categoria;
@synthesize aListaSistemi;

- (id)initWithName:(NSString *)pName ID:(int)pID Categoria:(NSString *) pCategoria
{
    self = [super init];
    if (self)
    {
        NSString * rNomeImmagine;
        nome = [[NSString alloc]initWithString:pName];
        ID = pID;
        categoria = pCategoria;
        
        CFStringRef fileExtension = (CFStringRef) [nome pathExtension];
        rNomeImmagine = [NSString stringWithFormat:@"%@.png", fileExtension];
        NSString* rDocumentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString* rFile = [rDocumentsPath stringByAppendingPathComponent:rNomeImmagine];
        if([[NSFileManager defaultManager] fileExistsAtPath:rNomeImmagine])
            immagine = [UIImage imageNamed:rNomeImmagine];
        else
            immagine = [UIImage imageNamed:@"document.png"];
    }
    return self;
}
@end
