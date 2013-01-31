//
//  Menu.m
//  SPEA
//
//  Created by Marco Battisti on 19/01/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import "Menu.h"
#import "ListItem.h"
#import "sqlite3.h"

@implementation Menu
@synthesize aListItems;
@synthesize ID;
@synthesize nome;



- (id)initWithName:(NSString *)pNome pID:(int)pID
{
    self = [super init];
    if (self)
    {
        nome = pNome;
        ID = pID;
        aListItems = [[NSMutableArray alloc] initWithCapacity:30];
        
        [self fGetFigli];
    }
    return self;
}

- (Menu*) fGetFigli
{
    sqlite3_stmt *sqlStatementMenu;
    sqlite3_stmt *sqlStatementFigli;
    const char *cStringFigli;
    const char *cStringMenu;
    
    @try
    {
        NSFileManager * fileMgr = [NSFileManager defaultManager];
        NSString * dbPath = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:@"spea.sqlite"];
        BOOL success = [fileMgr fileExistsAtPath:dbPath];
        sqlite3 * db;
        
        if(!success)
        {
            NSLog(@"Cannot locate database file '%@'.", dbPath);
        }
        if(!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK))
        {
            NSLog(@"An error has occured.");
        }
        
        NSString * sql = @" \
        SELECT Figlio.vcID as ID, Figlio.vcNome as vcNome  \
        FROM tblMenu  \
        left join tblVociMenu as  Figlio on meFiglio = Figlio.vcID \
        left join tblVociMenu as Padre on mepadre = Padre.vcID \
        where mepadre = $0 \
        ";
        
        sql = [sql stringByReplacingOccurrencesOfString:@"$0" withString:[NSString stringWithFormat:@"%d", ID]];
        
        cStringMenu = [sql cStringUsingEncoding:NSASCIIStringEncoding];
        
        
        if(sqlite3_prepare(db, cStringMenu, -1, &sqlStatementMenu, NULL) != SQLITE_OK)
        {
            NSLog(@"Problem with prepare statement");
        }
        else
        {
            while (sqlite3_step(sqlStatementMenu)==SQLITE_ROW)
            {
                ListItem *rItem = [[ListItem alloc]init];
                rItem.liID = sqlite3_column_int(sqlStatementMenu, 0);
                
                rItem.nome = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatementMenu,1)];
                //rItem.nome = [rItem.nome substringFromIndex:[rItem.nome length] - 4];
                /* = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];
                const char *raw = sqlite3_column_blob(sqlStatement, 3);
                int rawLen = sqlite3_column_bytes(sqlStatement, 3);
                NSData *data = [NSData dataWithBytes:raw length:rawLen];
                MyWine.photo = [[UIImage alloc] initWithData:data]; */
                
                sql = @" \
                SELECT count(*) as tot  \
                FROM tblVociMenu as Figlio \
                join tblMenu on mePadre = Figlio.vcID \
                where Figlio.vcID = $0 \
                ";
                sql = [sql stringByReplacingOccurrencesOfString:@"$0"
                                                     withString:[NSString stringWithFormat:@"%d", rItem.liID]];
                cStringFigli = [sql cStringUsingEncoding:NSASCIIStringEncoding];
                
                if(sqlite3_prepare(db, cStringFigli, -1, &sqlStatementFigli, NULL) == SQLITE_OK)
                {
                    while (sqlite3_step(sqlStatementFigli)==SQLITE_ROW)
                    {
                        /*UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Alert View Title"
                                                message:[NSMutableString stringWithFormat:@"String with one int %d", sqlite3_column_int(sqlStatementFigli, 0)]
                                                delegate:nil cancelButtonTitle:nil
                                                otherButtonTitles:@"OK", nil];
                        [alertView show];
                        [alertView release];*/
                        
                        if(sqlite3_column_int(sqlStatementFigli, 0) > 0)
                            rItem.HasSons = TRUE;
                        else
                            rItem.HasSons = FALSE;
                    }
                }
                
                rItem.immagine = [UIImage imageNamed:@"ListItem.png"];
                
                [aListItems addObject:rItem];
            }
        }
    }
    @catch (...)
    {
        //
    }    
    
    return self;
}
@end
