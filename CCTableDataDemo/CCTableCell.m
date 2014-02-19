//
//  CCTableCell.m
//  Debatable
//
//  Created by Alex Martin on 2/15/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import "CCTableCell.h"

@implementation CCTableCell

+ (id)createWithTitle:(NSString *)title andAccessory:(UITableViewCellAccessoryType)accessory andTappedBlock:(void (^)(void))block {
    CCTableCell *cell = [CCTableCell new];
    cell.title = title;
    cell.accessory = accessory;
    cell.callbackTap = block;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

+ (id)createWithTitle:(NSString *)title tap:(void (^)(void))block {
    CCTableCell *cell = [CCTableCell new];
    cell.title = title;
    cell.callbackTap = block;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

+ (id)createWithTitle:(NSString *)title ofStyle:(UITableViewCellStyle)style tap:(void (^)(void))block {
    CCTableCell *cell = [CCTableCell new];
    cell.title = title;
    cell.style = style;
    cell.callbackTap = block;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

+ (id)createWithTitle:(NSString *)title andSubtitle:(NSString *)subTitle tap:(void (^)(void))block {
    CCTableCell *cell = [CCTableCell new];
    cell.title = title;
    cell.subtitle = subTitle;
    cell.callbackTap = block;
    cell.style = UITableViewCellStyleValue1;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UITableViewCell *)createTableViewCellWithID:(NSString *)cellID onTableView:(UITableView *)table {
    UITableViewCell *cell = [table dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:self.style reuseIdentifier:cellID];
    cell.textLabel.text = self.title;
    cell.detailTextLabel.text = self.subtitle;
    cell.selectionStyle = self.selectionStyle;
    cell.accessoryType = self.accessory;
    return cell;
}

@end
