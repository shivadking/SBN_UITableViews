//
//  ViewController.h
//  CellExpandSample
//
//  Created by Thiru on 26/11/13.
//  Copyright (c) 2013 Thiru. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellEx1.h"
#import "CellEx2.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableExpand;

@property(nonatomic,strong) NSArray *arrayGames,*arrayVersions;

@end
