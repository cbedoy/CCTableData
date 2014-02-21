//
//  CCTableSection.h
//  Debatable
//
//  Created by Alex Martin on 2/15/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCTableCell.h"

@interface CCTableSection : NSObject

+ (id) createWithTitle:(NSString*)title andCells:(NSArray*)cells;

- (void) addCell:(CCTableCell*)cell;

- (void) removeCellAtIndex:(NSInteger)index;

- (void) replaceCellAtIndex:(NSInteger)index withCell:(CCTableCell*)cell;

- (CCTableCell*) getCellAtIndex:(NSInteger)index;

@property NSString *title;
@property NSMutableArray *cells;

@end
