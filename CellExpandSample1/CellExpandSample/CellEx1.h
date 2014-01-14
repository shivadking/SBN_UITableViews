//
//  CellEx1.h
//  CellExpandSample
//
//  Created by Thiru on 26/11/13.
//  Copyright (c) 2013 Thiru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellEx1 : UITableViewCell


@property(nonatomic,strong) IBOutlet UILabel *lblGame;

@property(nonatomic,strong) IBOutlet UIImageView *imgViewarrow;


- (void)changeArrowWithUp:(BOOL)up;

@end
