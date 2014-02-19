//
//  CCTableCell.h
//  Debatable
//
//  Created by Alex Martin on 2/15/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCTableCell : NSObject

/*! Create the cell with the specified title and tapped block */
+ (id) createWithTitle:(NSString*)title tap:(void(^)(void))block;

/*! Create the cell with the specified title, style, and tapped block */
+ (id) createWithTitle:(NSString*)title ofStyle:(UITableViewCellStyle)style tap:(void(^)(void))block;

/*! Create the cell with the specified title, accessory, and execution block when tapped */
+ (id) createWithTitle:(NSString*)title andAccessory:(UITableViewCellAccessoryType)accessory andTappedBlock:(void(^)(void))block;

/*! Create the cell with the title and subtitle */
+ (id) createWithTitle:(NSString*)title andSubtitle:(NSString*)subTitle tap:(void(^)(void))block;

/*! Create a table view cell object from this cell */
- (UITableViewCell*) createTableViewCellWithID:(NSString*)cellID onTableView:(UITableView*)table;

/*! The title of the cell */
@property NSString *title;

/*! The subtitle of the cell (if applicable) */
@property NSString *subtitle;

/*! The accessory type for the cell */
@property UITableViewCellAccessoryType accessory;

/*! The style of the cell */
@property UITableViewCellStyle style;

/*! The selection style for the cell */
@property UITableViewCellSelectionStyle selectionStyle;

/*! The callback to execute when the cell is tapped */
@property (copy) void (^callbackTap)(void);

/*! The callback to execute when the cell is selected */
@property (copy) void (^callbackSelect)(void);

@end
