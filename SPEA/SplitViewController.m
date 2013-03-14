//
//  SplitViewController.m
//  SPEA
//
//  Created by Marco Battisti on 14/03/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import <QuickLook/QuickLook.h>

#import "SplitViewController.h"
#import "MenuViewController.h"
#import "DocumentViewController.h"

@interface SplitViewController ()

@end

@implementation SplitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UISplitViewController *rSplit = [[UISplitViewController alloc] init];
        
        DocumentViewController *rMenuViewController = [[DocumentViewController alloc] initWithName:@"Prodotti" pID:0];
        rMenuViewController.title = @"Prodotti";
        
        UINavigationController *rMenuNavController = [[UINavigationController alloc] initWithRootViewController: rMenuViewController];
        
        //detailNavController = [[UINavigationController alloc] initWithRootViewController:tempViewController];
        //[tempViewController release];
        
        rSplit.title = @"Documenti";
        rSplit.viewControllers = [NSArray arrayWithObjects:rMenuNavController, nil, nil];
    
        
        [self.view addSubview:rSplit.view];
        
        [rSplit release];
        
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
