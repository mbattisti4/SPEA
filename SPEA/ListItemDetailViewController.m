//
//  ListItemDetailViewController.m
//  SPEA
//
//  Created by Jolly on 25/01/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import "ListItemDetailViewController.h"
#import "ListItem.h"

@interface ListItemDetailViewController ()

@end

@implementation ListItemDetailViewController
@synthesize rListItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pListItem:(ListItem*)pLI
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        rListItem = pLI;
        
        UILabel *lblNome = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 25)];
        lblNome.text = rListItem.nome;
        lblNome.font = [UIFont fontWithName:@"Arial" size: 18.0];
        lblNome.shadowColor = [UIColor grayColor];
        //lblNome.shadowOffset = CGSizeMake(1,1);
        lblNome.textAlignment = kCTLeftTextAlignment;
        
        [self.view addSubview:lblNome];        
        [lblNome release];        

        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, lblNome.frame.origin.y+lblNome.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
        textView.textColor = [UIColor blackColor];
        textView.font = [UIFont fontWithName:@"Arial" size:18];
        textView.backgroundColor = [UIColor whiteColor];
        textView.editable = FALSE;
        textView.text = rListItem.descrizione;
        textView.scrollEnabled = YES;
        
        [self.view addSubview:textView];
        
        [textView release];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
