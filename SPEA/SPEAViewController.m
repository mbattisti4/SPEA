//
//  SPEAViewController.m
//  SPEA
//
//  Created by Marco Battisti on 19/01/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import "SPEAViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SPEAViewController ()

@end

@implementation SPEAViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor lightGrayColor];
        
        UILabel * lblDescrAzienda = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, 300, 300)];
        lblDescrAzienda.text = @" \
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  \
        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.  \
        Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \
        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  \
        Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.  \
        Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \
        ";
        lblDescrAzienda.numberOfLines = 0;
        lblDescrAzienda.shadowColor = [UIColor blackColor];
        lblDescrAzienda.layer.cornerRadius = 5.0;
        lblDescrAzienda.layer.masksToBounds = YES;
        lblDescrAzienda.textAlignment = NSTextAlignmentLeft;
        lblDescrAzienda.textColor = [UIColor darkTextColor];
        [lblDescrAzienda sizeToFit];
        
        
        [self.view addSubview:lblDescrAzienda];
        [lblDescrAzienda release];
        
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
