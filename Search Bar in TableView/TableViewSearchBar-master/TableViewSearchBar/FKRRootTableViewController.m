//
//  FKRViewController.m
//  TableViewSearchBar
//
//  Created by Fabian Kreiser on 10.02.13.
//  Copyright (c) 2013 Fabian Kreiser. All rights reserved.
//

#import "FKRRootTableViewController.h"
#import "FKRDefaultSearchBarTableViewController.h"
#import "FKRTopSearchBarTableViewController.h"
#import "FKRHeaderSearchBarTableViewController.h"

static NSString * const kFKRRootTableViewControllerSectionIndexesSwitchTableViewCellIdentifier = @"kFKRRootTableViewControllerSectionIndexesSwitchTableViewCellIdentifier";
static NSString * const kFKRRootTableViewControllerDefaultTableViewCellIdentifier = @"kFKRRootTableViewControllerDefaultTableViewCellIdentifier";

static NSString * const kFKRRootTableViewControllerShowSectionIndexesUserDefaultsKey = @"Show Section Indexes";

@interface FKRRootTableViewController () {
    
}

- (void)toggleSectionIndexesSwitch:(UISwitch *)sender;

@property(nonatomic, assign) BOOL showSectionIndexes;

@property(nonatomic, strong, readonly) UISwitch *sectionIndexesSwitch;

@end

@implementation FKRRootTableViewController
@synthesize sectionIndexesSwitch = _sectionIndexesSwitch;

#pragma mark - Initializer

- (id)init
{
    if ((self = [super initWithStyle:UITableViewStyleGrouped])) {
        self.title = @"Root";
        
        _showSectionIndexes = [[NSUserDefaults standardUserDefaults] boolForKey:kFKRRootTableViewControllerShowSectionIndexesUserDefaultsKey];
    }
    
    return self;
}

#pragma mark - Switch

- (UISwitch *)sectionIndexesSwitch
{
    if (_sectionIndexesSwitch == nil) {
        _sectionIndexesSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
        [_sectionIndexesSwitch addTarget:self action:@selector(toggleSectionIndexesSwitch:) forControlEvents:UIControlEventValueChanged];
    }
    
    return _sectionIndexesSwitch;
}

- (void)toggleSectionIndexesSwitch:(id)sender
{
    self.showSectionIndexes = [(UISwitch *)sender isOn];
    [[NSUserDefaults standardUserDefaults] setBool:self.showSectionIndexes forKey:kFKRRootTableViewControllerShowSectionIndexesUserDefaultsKey];
}

#pragma mark TableView Delegate and DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 3;
    } else {
        NSAssert(section > 1, @"Unexpected number of sections!");
        return -1;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return @"Search Bar Behavior";
    }
    
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFKRRootTableViewControllerSectionIndexesSwitchTableViewCellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kFKRRootTableViewControllerSectionIndexesSwitchTableViewCellIdentifier];
        }
        
        cell.textLabel.text = @"Show Section Indexes";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.accessoryView = self.sectionIndexesSwitch;
        self.sectionIndexesSwitch.on = self.showSectionIndexes;
        
        return cell;
    } else if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kFKRRootTableViewControllerDefaultTableViewCellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kFKRRootTableViewControllerDefaultTableViewCellIdentifier];
        }
        
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Default Search Bar";
            cell.detailTextLabel.text = @"Mail, Music, Videos, ...";
        } else if (indexPath.row == 1) {
            cell.textLabel.text = @"Top Search Bar";
            cell.detailTextLabel.text = @"Notes, GameCenter";
        } else if (indexPath.row == 2) {
            cell.textLabel.text = @"Header Search Bar";
            cell.detailTextLabel.text = @"Contacts";
        } else {
            NSAssert(indexPath.row > 2, @"Unexpected number of rows in second section!");
        }
        
        return cell;
    } else {
        NSAssert(indexPath.section > 1, @"Unexpected number of sections!");
        return nil;
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) { // Make the switch not selectable
        return nil;
    }
    
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        UIViewController *viewController = nil;
        if (indexPath.row == 0) {
            viewController = [[FKRDefaultSearchBarTableViewController alloc] initWithSectionIndexes:self.showSectionIndexes];
        } else if (indexPath.row == 1) {
            viewController = [[FKRTopSearchBarTableViewController alloc] initWithSectionIndexes:self.showSectionIndexes];
        } else if (indexPath.row == 2) {
            viewController = [[FKRHeaderSearchBarTableViewController alloc] initWithSectionIndexes:self.showSectionIndexes];
        }
        
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end