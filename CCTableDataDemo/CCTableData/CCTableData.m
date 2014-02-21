//
//  CCTableData.m
//  Debatable
//
//  Created by Alex Martin on 2/15/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import "CCTableData.h"

@implementation CCTableData

+ (id)createWithSections:(NSArray *)sections {
    CCTableData *data = [CCTableData new];
    data.sections = [NSMutableArray arrayWithArray:sections];
    return data;
}

- (void)addSection:(CCTableSection *)section {
    [self.sections addObject:section];
}

- (void)removeSectionAtIndex:(NSInteger)index {
    if (self.sections.count > index) [self.sections removeObjectAtIndex:index];
}

- (void)replaceSectionAtIndex:(NSInteger)index withSection:(CCTableSection *)section {
    if (self.sections.count > index) [self.sections replaceObjectAtIndex:index withObject:section];
}

- (CCTableSection *)getSectionAtIndex:(NSInteger)index {
    return (self.sections.count > index) ? [self.sections objectAtIndex:index] : nil;
}

- (CCTableCell *)getCellForIndexPath:(NSIndexPath*)path {
    return [[self getSectionAtIndex:path.section] getCellAtIndex:path.row];
}

- (void)tappedCellAtIndexPath:(NSIndexPath *)indexPath {
    CCTableCell *cell = [self getCellForIndexPath:indexPath];
    if (cell != nil && cell.callbackTap != nil) cell.callbackTap();
}

- (void)selectedCellAtIndexPath:(NSIndexPath *)indexPath {
    CCTableCell *cell = [self getCellForIndexPath:indexPath];
    if (cell != nil && cell.callbackSelect != nil) cell.callbackSelect();
}

- (UITableViewCell *)createCellForIndexPath:(NSIndexPath *)path withReuseIdentifier:(NSString *)reuseID onTable:(UITableView *)table {
    return [[self getCellForIndexPath:path] createTableViewCellWithID:reuseID onTableView:table];
}

@end
