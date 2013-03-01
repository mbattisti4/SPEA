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
    NSMutableArray *aListaSistemi;
}

@property (nonatomic, strong) NSMutableArray* aListaSistemi;
@property (nonatomic, strong) NSString* nome;
@property (nonatomic) int ID;
@end
