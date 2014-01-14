//
//  CellEx1.m
//  CellExpandSample
//
//  Created by Thiru on 26/11/13.
//  Copyright (c) 2013 Thiru. All rights reserved.
//

#import "CellEx1.h"

@implementation CellEx1

@synthesize lblGame,imgViewarrow;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)changeArrowWithUp:(BOOL)up
{
    if (up)
    {
        self.imgViewarrow.image = [UIImage imageNamed:@"imgUpAccessory.png"];
    }
    else
    {
        self.imgViewarrow.image = [UIImage imageNamed:@"imgDownAccessory.png"];
    }
}


@end
