//
//  ListItemGalleryViewController.m
//  SPEA
//
//  Created by Marco Battisti on 02/02/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import "ListItemGalleryViewController.h"

@interface ListItemGalleryViewController ()

@end

@implementation ListItemGalleryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor redColor]];
        
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
