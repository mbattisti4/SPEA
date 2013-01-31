//
//  MenuViewController.h
//  SPEA
//
//  Created by Marco Battisti on 19/01/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Menu.h"

@interface MenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    Menu * rMenu;
}

@property (nonatomic, strong) Menu* rMenu;

- (id)initWithName:(NSString *)pNome pID:(int)pID;

@end
