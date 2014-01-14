//
//  ViewController.m
//  CellExpandSample
//
//  Created by Thiru on 26/11/13.
//  Copyright (c) 2013 Thiru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;

@end

@implementation ViewController

@synthesize arrayGames,tableExpand,arrayVersions;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    arrayGames=@[@"Need For Speed",@"Max Payne",@"Brothers In Arms",@"Far Cry"];
    
    arrayVersions=@[@"1",@"2",@"3",@"4"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.tableExpand.sectionFooterHeight = 0;
    self.tableExpand.sectionHeaderHeight = 0;
    self.isOpen = NO;

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [arrayGames count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (self.isOpen) {
        if (self.selectIndex.section == section) {
            return [arrayVersions count]+1;
        }
    }

return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isOpen&&self.selectIndex.section == indexPath.section&&indexPath.row!=0)
    {
    
        static NSString *CellIdentifier2 = @"CellEx2";
        
        CellEx2 *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
        
        if(cell==nil)
        {
            cell=[[CellEx2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2];
        }
        NSLog(@"IndexPathRow = %d, Index Section = %d",indexPath.row,indexPath.section);
        cell.lblVersion.text=[arrayVersions objectAtIndex:indexPath.row - 1];
        
        return cell;
    }
    else
    {
        static NSString *CellIdentifier1 = @"CellEx1";
        CellEx1 *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
        
        if(cell==nil)
        {
            cell=[[CellEx1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
        }
        
        cell.lblGame.text=[arrayGames objectAtIndex:indexPath.section];
        
        [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath]?YES:NO)];
        
        return cell;
    }
    
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 0)
    {
        if ([indexPath isEqual:self.selectIndex]) {
            self.isOpen = NO;
            [self didSelectCellRowFirstDo:NO nextDo:NO];
            self.selectIndex = nil;
            
        }
        else
        {
            if (!self.selectIndex)
            {
                self.selectIndex = indexPath;
                [self didSelectCellRowFirstDo:YES nextDo:NO];
                
            }
            else
            {
                
                [self didSelectCellRowFirstDo:NO nextDo:YES];
            }
        }
    }
    
        
        
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    
    CellEx1 *cell = (CellEx1 *)[self.tableExpand cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    
    [self.tableExpand beginUpdates];
    
    int section = self.selectIndex.section;
    int contentCount = [arrayVersions count];
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [self.tableExpand insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
	else
    {
        [self.tableExpand deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationTop];
    }
    
	
	
	[self.tableExpand endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [self.tableExpand indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    if (self.isOpen) [self.tableExpand scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}



@end
