//
//  ListItem.h
//  SPEA
//
//  Created by Marco Battisti on 19/01/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListItem : NSObject{
    int liID;
    NSString * nome;
    NSString * descrizione;
    UIImage * immagine;
    BOOL HasSons;
    
}

@property (nonatomic) int liID;
@property (nonatomic, strong) NSString* nome;
@property (nonatomic, strong) NSString* descrizione;
@property (nonatomic, strong) UIImage* immagine;
@property (nonatomic) BOOL HasSons;


@end




