//
//  ListItemDetailsViewController.h
//  SPEA
//
//  Created by Jolly on 01/02/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItem.h"

@interface ListItemDetailsViewController : UIViewController
{
    ListItem * rListItem;
}

@property(nonatomic, strong) ListItem * rListItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pListItem:(ListItem*)pLI;

@end
