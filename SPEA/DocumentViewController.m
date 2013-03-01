//
//  DocumentViewController.m
//  SPEA
//
//  Created by Marco Battisti on 01/03/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import "DocumentViewController.h"

@interface DocumentViewController ()

@end

@implementation DocumentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithName:(NSString *)pNome pID:(int)pID
{
    self = [super init];
    if (self)
    {
        //self.view.backgroundColor=[UIColor yellowColor];
        
        /*rMenu = [[Menu alloc] initWithName:pNome pID:pID];
        
        UITableView * tabTableView;
        
        tabTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
        tabTableView.dataSource = self;
        tabTableView.delegate = self;
        
        [self.view addSubview:tabTableView];
        
        [tabTableView release];*/
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
