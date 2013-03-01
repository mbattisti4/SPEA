//
//  DocumentViewController.h
//  SPEA
//
//  Created by Marco Battisti on 01/03/13.
//  Copyright (c) 2013 Icarus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocumentViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray * aDocumenti;
}

@property (nonatomic, strong) NSMutableArray * aDocumenti;

- (id)initWithName:(NSString *)pNome pListaDocumenti:(NSMutableArray *)pListaDocumenti;
@end
