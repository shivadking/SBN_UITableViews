//
//  CellEx2.m
//  CellExpandSample
//
//  Created by Thiru on 26/11/13.
//  Copyright (c) 2013 Thiru. All rights reserved.
//

#import "CellEx2.h"

@implementation CellEx2

@synthesize lblVersion;

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

@end
