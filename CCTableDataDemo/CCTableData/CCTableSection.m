//
//  CCTableSection.m
//  Debatable
//
//  Created by Alex Martin on 2/15/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import "CCTableSection.h"

@implementation CCTableSection

+ (id)createWithTitle:(NSString *)title andCells:(NSArray *)cells {
    CCTableSection *sect = [CCTableSection new];
    sect.title = title;
    sect.cells = [NSMutableArray arrayWithArray:cells];
    return sect;
}

- (id)init {
    self = [super init];
    self.title = @"";
    self.cells = [NSMutableArray new];
    return self;
}

- (void)addCell:(CCTableCell *)cell {
    [self.cells addObject:cell];
}

- (void)removeCellAtIndex:(NSInteger)index {
    if (self.cells.count > index) [self.cells removeObjectAtIndex:index];
}

- (void)replaceCellAtIndex:(NSInteger)index withCell:(CCTableCell *)cell {
    if (self.cells.count > index) [self.cells replaceObjectAtIndex:index withObject:cell];
}

- (CCTableCell *)getCellAtIndex:(NSInteger)index {
    return (self.cells.count > index) ? [self.cells objectAtIndex:index] : nil;
}

@end
