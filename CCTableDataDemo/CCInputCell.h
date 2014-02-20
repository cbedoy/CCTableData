//
//  CCInputCell.h
//  CCTableDataDemo
//
//  Created by Alex Martin on 2/19/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCInputCell : UITableViewCell <UITextFieldDelegate>

- (id) initWithIdentifier:(NSString*)identifier secureTextField:(BOOL)secureText;

@property UITextField *inputField;

@property UILabel *label;

@property (copy) void (^callbackInputTextEdited)(NSString *text);

@property (copy) void (^callbackInputReturnTapped)(NSString *text);

@end
