//
//  AppDelegate.m
//  SPEA
//
//  Created by Marco Battisti on 18/01/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import "AppDelegate.h"
#import "SPEAViewController.h"
#import "MenuViewController.h"
#import "DocumentViewController.h"
#import "Document.h"
#import "sqlite3.h"
#import "Reachability.h"

@implementation AppDelegate

- (void)dealloc
{
    [tabBarController release];
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    NSMutableArray * aDocumenti = [self fControllaAggiornamenti];
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = aDocumenti.count;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
    
    NSMutableArray *aControllers=[[NSMutableArray alloc] initWithCapacity:4];
    tabBarController = [[UITabBarController alloc]init]; 
    
    MenuViewController *rMenuViewController = [[MenuViewController alloc] initWithName:@"Prodotti" pID:0];
    rMenuViewController.title = @"Prodotti";
    rMenuViewController.tabBarItem.image = [UIImage imageNamed:@"settings.png"];
    
    DocumentViewController *rMenuViewController2 = [[DocumentViewController alloc] initWithName:@"Documenti" pListaDocumenti:aDocumenti];
    rMenuViewController2.title = @"Documenti";
    rMenuViewController2.tabBarItem.image = [UIImage imageNamed:@"settings.png"];
    
    SPEAViewController *rSPEAViewController = [[SPEAViewController alloc]initWithNibName:nil bundle:nil];
    rSPEAViewController.title = @"SPEA";
    rSPEAViewController.tabBarItem.image = [UIImage imageNamed:@"settings.png"];
    
    SPEAViewController *rSPEAViewController2 = [[SPEAViewController alloc]initWithNibName:nil bundle:nil];
    rSPEAViewController2.title = @"Settings";
    rSPEAViewController2.tabBarItem.image = [UIImage imageNamed:@"settings.png"];
    
    UINavigationController *rMenuNavController = [[UINavigationController alloc] initWithRootViewController: rMenuViewController];
    UINavigationController *rMenuNavController2 = [[UINavigationController alloc] initWithRootViewController: rMenuViewController2];
    
    [aControllers addObject:rMenuNavController2];
    [aControllers addObject:rMenuNavController];
    [aControllers addObject:rSPEAViewController];
    [aControllers addObject:rSPEAViewController2]; 
    
    tabBarController.viewControllers = aControllers;   
    
    [rSPEAViewController release];
    [rMenuViewController release];
    
    [self.window addSubview:tabBarController.view];
    [self.window setRootViewController:tabBarController];    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (NSMutableArray*) fControllaAggiornamenti
{
    //definizioni
    NSString * rNomeDBRemoto = @"dbSQLite.sqlite";
    NSString * rNomeDBLocale = @"spea.sqlite";
    NSString * rURLWS = @"http://localhost:8888/SPEAMobilityWS/";
    
    NSData * rFetchedData = [NSData dataWithContentsOfURL:[NSURL URLWithString:rURLWS]];
    NSString * rPathCartellaDocumenti = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString * rNomeDBRemotoInCartellaDocumenti = [rPathCartellaDocumenti stringByAppendingPathComponent:rNomeDBRemoto];
    NSString * rNomeDBRemotoInMainBundle = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:rNomeDBRemoto];
    NSFileManager *rFileManager = [NSFileManager defaultManager];
    NSString * rSql;
    sqlite3 * db;
    const char * cStringMenu;
    sqlite3_stmt * rSqlStatementMenu;
    BOOL rFileExists;
    NSError *rError;
    NSMutableArray *aListDocuments = [[NSMutableArray alloc] initWithCapacity:4];
    Document *rDocument;
    
    
    
    
    
    
    
    
    // allocate a reachability object
    /*Reachability* reach = [Reachability reachabilityWithHostName:rURLWS ];
    
    // tell the reachability that we DONT want to be reachable on 3G/EDGE/CDMA
    if([reach reachabilityForLocalWiFi])
        NSLog(@"WIFI Attiva");
    else
        NSLog(@"WIFI NON Attiva");
    
    // here we set up a NSNotification observer. The Reachability that caused the notification
    // is passed in the object parameter
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    
    [reach startNotifier];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];*/

    
    
    
    
    
    
    
    
    
    
    
    //scarico l'ultima versione del db
    [rFetchedData writeToFile:rNomeDBRemotoInCartellaDocumenti atomically:YES];
    
    rPathCartellaDocumenti = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* rFile = [rPathCartellaDocumenti stringByAppendingPathComponent:rNomeDBRemoto];
    
    
    //copio il file dalla cartella dei documenti a quella dell'app   
    if ([rFileManager fileExistsAtPath:rNomeDBRemotoInMainBundle] == YES)
    {
        [rFileManager removeItemAtPath:rNomeDBRemotoInCartellaDocumenti error:&rError];
        NSLog(@"%@ è già presente, lo cancello", rNomeDBRemotoInCartellaDocumenti);
    }
    
    [rFileManager copyItemAtPath:rNomeDBRemotoInCartellaDocumenti toPath:rNomeDBRemotoInMainBundle error:&rError];    
    
    //controllo se i due database esistono
    rFileExists = [[NSFileManager defaultManager] fileExistsAtPath:rNomeDBRemotoInMainBundle];
    
    if(rFileExists)
        NSLog(@"%@ ESISTE", rNomeDBRemoto);
    else
        NSLog(@"%@ NON ESISTE", rNomeDBRemoto);
    
    rFile = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:rNomeDBLocale];
    rFileExists = [[NSFileManager defaultManager] fileExistsAtPath:rFile];
    
    if(rFileExists)
        NSLog(@"%@ ESISTE", rNomeDBLocale);
    else
        NSLog(@"%@ NON ESISTE", rNomeDBLocale);
    
    //faccio una query sul DB
    rFileManager = [NSFileManager defaultManager];
    rNomeDBRemotoInMainBundle = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:rNomeDBRemoto];
    rFileExists = [rFileManager fileExistsAtPath:rNomeDBRemotoInMainBundle];
    
    if(!rFileExists)
    {
        NSLog(@"Cannot locate database file '%@'.", rNomeDBRemotoInMainBundle);
    }
    if(!(sqlite3_open([rNomeDBRemotoInMainBundle UTF8String], &db) == SQLITE_OK))
    {
        NSLog(@"An error has occured.");
    }
    
    rSql = @"SELECT filID, filNome, catNome, SysNome FROM tblFiles \
    join tblCategorie on filCategoria = catID \
    left join tblFileSistemi on filSysFilID = filID \
    left join tblSistemi on SysID = filSysSysID \
    order by SysNome desc, catNome, filNome ";
    cStringMenu = [rSql cStringUsingEncoding:NSASCIIStringEncoding];
    
    if(sqlite3_prepare(db, cStringMenu, -1, &rSqlStatementMenu, NULL) != SQLITE_OK)
    {
        NSLog(@"Problem with prepare statement");
    }
    else
    {
        while (sqlite3_step(rSqlStatementMenu)==SQLITE_ROW)
        {
            /*NSLog(@"%d-%@",
                  sqlite3_column_int(rSqlStatementMenu, 0),
                  [NSString stringWithUTF8String:(char *) sqlite3_column_text(rSqlStatementMenu,1)]);*/
            
            rDocument = [[Document alloc]initWithName:[NSString stringWithUTF8String:(char *) sqlite3_column_text(rSqlStatementMenu,1)]
                                                        ID:sqlite3_column_int(rSqlStatementMenu, 0)
                                                        Categoria:[NSString stringWithUTF8String:(char *) sqlite3_column_text(rSqlStatementMenu,2)]];
            
            [aListDocuments addObject:rDocument];
        }
    }
    
    return aListDocuments;
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
