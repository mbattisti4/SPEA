//
//  ListItemDetailViewController.h
//  SPEA
//
//  Created by Jolly on 25/01/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListItem.h"

@interface ListItemDetailViewController : UIViewController
{
    ListItem * rListItem;
}

@property(nonatomic, strong) ListItem * rListItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil pListItem:(ListItem*)pLI;

@end
