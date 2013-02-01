//
//  MenuViewController.m
//  SPEA
//
//  Created by Marco Battisti on 19/01/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import "MenuViewController.h"
#import "ListItemDetailsViewController.h"
#import "Menu.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize rMenu;

- (id)initWithName:(NSString *)pNome pID:(int)pID
{
    self = [super init];
    if (self)
    {
        self.view.backgroundColor=[UIColor yellowColor];
        
        rMenu = [[Menu alloc] initWithName:pNome pID:pID];
        
        UITableView * tabTableView;
        
        tabTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];        
        tabTableView.dataSource = self;
        tabTableView.delegate = self;
        
        [self.view addSubview:tabTableView];
        
        [tabTableView release];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

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
    return [rMenu.aListItems count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";   
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];        
    }
    cell.textLabel.text = [[rMenu.aListItems objectAtIndex:indexPath.row]nome];
    cell.detailTextLabel.text = [[rMenu.aListItems objectAtIndex:indexPath.row]descrizione];
    cell.imageView.image = [[rMenu.aListItems objectAtIndex:indexPath.row]immagine];
    
    if([[rMenu.aListItems objectAtIndex:indexPath.row]HasSons] == TRUE)
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    else
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
                
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSString * rValoreRicavato;
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
    }
    
    
}

- (void)viewDidLoad
{
    [rMenu release];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
