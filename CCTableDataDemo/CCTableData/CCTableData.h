//
//  CCTableData.h
//  Debatable
//
//  Created by Alex Martin on 2/15/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCTableSection.h"

@interface CCTableData : NSObject

+ (id) createWithSections:(NSArray*)sections;

- (void) addSection:(CCTableSection*)section;

- (void) removeSectionAtIndex:(NSInteger)index;

- (void) replaceSectionAtIndex:(NSInteger)index withSection:(CCTableSection *)section;

- (CCTableSection*) getSectionAtIndex:(NSInteger)index;

- (CCTableCell*) getCellForIndexPath:(NSIndexPath*)path;

- (UITableViewCell*) createCellForIndexPath:(NSIndexPath*)path withReuseIdentifier:(NSString*)reuseID onTable:(UITableView*)table;

- (void) tappedCellAtIndexPath:(NSIndexPath*)indexPath;

- (void) selectedCellAtIndexPath:(NSIndexPath*)indexPath;

@property NSMutableArray *sections;

@end
