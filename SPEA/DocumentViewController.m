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
@synthesize aDocumenti;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithName:(NSString *)pNome pListaDocumenti:(NSMutableArray *)pListaDocumenti
{
    self = [super init];
    if (self)
    {
        aDocumenti = pListaDocumenti;
        
        //self.view.backgroundColor=[UIColor yellowColor];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(save:)];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(save:)];
        
        UITableView * tabTableView;
        
        NSLog(@"%f", self.view.frame.size.width);
        NSLog(@"%f", self.view.frame.size.height);
        tabTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        
        
        
        tabTableView.dataSource = self;
        tabTableView.delegate = self;
        
        [self.view addSubview:tabTableView];
        
        [tabTableView release];
        
        
    }
    return self;
}

/*metodo obbligatorio perchè datasource*/
- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/*metodo obbligatorio perchè datasource*/
- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [aDocumenti count];
}

/*metodo obbligatorio perchè datasource*/
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [[aDocumenti objectAtIndex:indexPath.row]nome];
    /*cell.detailTextLabel.text = [[rMenu.aListItems objectAtIndex:indexPath.row]descrizione];
    cell.imageView.image = [[rMenu.aListItems objectAtIndex:indexPath.row]immagine];
    
    if([[rMenu.aListItems objectAtIndex:indexPath.row]HasSons] == TRUE)
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    else
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;*/
    
    return cell;
}

/*metodo obbligatorio perchè datasource*/
-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    /*NSString * rValoreRicavato;
    int rID;
    
    rValoreRicavato = [[rMenu.aListItems objectAtIndex:indexPath.row]nome];
    rID = [[rMenu.aListItems objectAtIndex:indexPath.row] liID];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if([[rMenu.aListItems objectAtIndex:indexPath.row] HasSons] == TRUE)
    {
        MenuViewController *rMenuViewController = [[MenuViewController alloc] initWithName:rValoreRicavato pID:rID];
        [rMenuViewController setTitle:rValoreRicavato];
        
        [self.navigationController pushViewController:rMenuViewController animated:YES];
        
        [rMenuViewController release];
    }
    else
    {
        ListItemDetailsViewController * rListItemDetailViewController = [[ListItemDetailsViewController alloc]
                                                                         initWithNibName:nil
                                                                         bundle:nil
                                                                         pListItem:[rMenu.aListItems objectAtIndex:indexPath.row]];
        
        [self.navigationController pushViewController:rListItemDetailViewController animated:YES];
        
        [rListItemDetailViewController release];
    }*/
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIInterfaceOrientation interfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width);// set your dimensions as per landscape view
    }
    else if(interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);// set your dimensions as per portrait view
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
