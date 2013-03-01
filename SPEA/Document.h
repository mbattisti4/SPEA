//
//  Document.h
//  SPEA
//
//  Created by Marco Battisti on 01/03/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Document : NSObject
{
    int ID;
    NSString * nome;
    NSString * categoria;
    UIImage * immagine;
    NSMutableArray *aListaSistemi;
}

@property (nonatomic, strong) NSMutableArray* aListaSistemi;
@property (nonatomic, strong) NSString* nome;
@property (nonatomic, strong) NSString* categoria;
@property (nonatomic, strong) UIImage* immagine;
@property (nonatomic) int ID;

- (id)initWithName:(NSString *)pName ID:(int)pID Categoria:(NSString *) pCategoria;
@end
