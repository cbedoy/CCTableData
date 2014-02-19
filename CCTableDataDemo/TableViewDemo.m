//
//  TableViewDemo.m
//  CCTableDataDemo
//
//  Created by Alex Martin on 2/18/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import "TableViewDemo.h"
#import "CCTableData.h"

@interface TableViewDemo ()

@property CCTableData *data;
@property NSInteger tapMeCount;

@end

@implementation TableViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"TableView Demo"];
    self.tapMeCount = 0;
    
    // Create the table data here for our demo purposes.
    // In a real application, this could be created anywhere- even in a completely different class, then passed to this one on init.
    
    // Create the first section
    CCTableCell *firstCell = [CCTableCell createWithTitle:@"I'm the first!" tap:^{
        [[[UIAlertView alloc] initWithTitle:@"Tapped"
                                    message:@"Tapped the first cell!"
                                   delegate:nil cancelButtonTitle:@"Ok!" otherButtonTitles:nil, nil] show];
    }];
    CCTableCell *secondCell = [CCTableCell createWithTitle:@"I'm the second :(" tap:nil];
    CCTableSection *firstSection = [CCTableSection createWithTitle:@"First Section" andCells:@[firstCell, secondCell]];
    
    // Show some different cell types
    CCTableCell *discloseCell = [CCTableCell createWithTitle:@"I disclose things" andAccessory:UITableViewCellAccessoryDisclosureIndicator andTappedBlock:nil];
    CCTableCell *checkCell = [CCTableCell createWithTitle:@"I am checked!" andAccessory:UITableViewCellAccessoryCheckmark andTappedBlock:^{
        CCTableCell *cell = [[self.data getSectionAtIndex:1] getCellAtIndex:1];
        if (cell.accessory == UITableViewCellAccessoryCheckmark) {
            cell.accessory = UITableViewCellAccessoryNone;
        } else {
            cell.accessory = UITableViewCellAccessoryCheckmark;
        }
        [self.tableView reloadData];
    }];
    CCTableSection *secondSection = [CCTableSection createWithTitle:nil andCells:@[discloseCell, checkCell]];
    
    CCTableCell *subCell = [CCTableCell createWithTitle:@"I'm a title!" andSubtitle:@"And I'm a subtitle..." tap:nil];
    CCTableCell *tapMeCell = [CCTableCell createWithTitle:@"Tap Me!" ofStyle:UITableViewCellStyleSubtitle tap:^{
        self.tapMeCount ++;
        [[[self.data getSectionAtIndex:2] getCellAtIndex:1] setSubtitle:[NSString stringWithFormat:@"I've been tapped %i time(s)!", self.tapMeCount]];
        [self.tableView reloadData];
    }];
    CCTableSection *thirdSection = [CCTableSection createWithTitle:@"Third Section" andCells:@[subCell, tapMeCell]];
    
    // Add the cells to the table model
    self.data = [CCTableData createWithSections:@[firstSection, secondSection, thirdSection]];
}

#pragma mark - Table view data source

// Then, for the data source methods and callbacks, we basically just hook them up to the CCTableData object.
// In most cases, we can accomplish with a single line what used to take a fair amount of work to do.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data getSectionAtIndex:section].cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.data createCellForIndexPath:indexPath withReuseIdentifier:@"cell" onTable:self.tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.data tappedCellAtIndexPath:indexPath];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.data getSectionAtIndex:section].title;
}

@end
