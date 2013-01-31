//
//  Menu.h
//  SPEA
//
//  Created by Marco Battisti on 19/01/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListItem.h"

@interface Menu : NSObject
{
    NSString * nome;
    int ID;
    NSMutableArray *aListItems;
}

@property (nonatomic, strong) NSMutableArray* aListItems;
@property (nonatomic, strong) NSString* nome;
@property (nonatomic) int ID;


- (id)initWithName:(NSString *)pNome pID:(int)pID;
- (Menu*) fGetFigli;


@end
