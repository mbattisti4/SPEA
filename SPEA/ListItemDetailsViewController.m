//
//  ListItemDetailsViewController.m
//  SPEA
//
//  Created by Jolly on 01/02/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import "ListItemDetailsViewController.h"
#import "ListItem.h"

@interface ListItemDetailsViewController ()

@end

@implementation ListItemDetailsViewController
@synthesize rListItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pListItem:(ListItem*)pLI
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        rListItem = pLI;
        
       
        //vista contenitore
        UIScrollView* rMainView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-20, self.view.frame.size.height-100)];
        [rMainView setBackgroundColor: [UIColor lightGrayColor]];
        rMainView.scrollEnabled = TRUE;
        [rMainView setContentSize:CGSizeMake(self.view.frame.size.width-20, 700)];
        
        [self.view addSubview: rMainView];
        [rMainView release];
        
        //titolo
        UILabel *lblNome = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, rMainView.frame.size.width-20, 25)];
        lblNome.text = rListItem.nome;
        lblNome.font = [UIFont fontWithName:@"Arial" size: 20.0];
        lblNome.shadowColor = [UIColor grayColor];
        
        //lblNome.shadowOffset = CGSizeMake(1,1);
        lblNome.textAlignment = NSTextAlignmentCenter;
        
        [rMainView addSubview:lblNome];
        [lblNome release];
        
        //descrizione
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, lblNome.frame.origin.y+lblNome.frame.size.height+10, rMainView.frame.size.width-20, rMainView.frame.size.height)];
        textView.textColor = [UIColor blackColor];
        textView.font = [UIFont fontWithName:@"Arial" size:18];
        textView.backgroundColor = [UIColor whiteColor];
        textView.editable = FALSE;
        textView.text = rListItem.descrizione;
        textView.scrollEnabled = FALSE;
         
        [rMainView addSubview:textView];
        [textView release];
        
        //bottone che porta alla photogallery
        UIButton * btnPhotoGallery = [[UIButton alloc] initWithFrame:CGRectMake(10, textView.frame.origin.y+textView.frame.size.height, rMainView.frame.size.width-20, 50)];
        btnPhotoGallery.tag = 1;
        btnPhotoGallery.backgroundColor=[UIColor yellowColor];
        [btnPhotoGallery setTitle:@"Show gallery" forState:UIControlStateNormal];
        
        [rMainView addSubview:btnPhotoGallery];
        [btnPhotoGallery release];
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
