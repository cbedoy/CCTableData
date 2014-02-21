//
//  CCInputCell.m
//  CCTableDataDemo
//
//  Created by Alex Martin on 2/19/14.
//  Copyright (c) 2014 Code Chimera. All rights reserved.
//

#import "CCInputCell.h"

@implementation CCInputCell

- (id)initWithIdentifier:(NSString *)identifier secureTextField:(BOOL)secureText {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    //create text label field
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, self.contentView.frame.size.width * 0.27, 20)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont systemFontOfSize:[UIFont smallSystemFontSize]]];
    [label setTextAlignment:NSTextAlignmentRight];
    [label setAdjustsFontSizeToFitWidth:true];
    [self.contentView addSubview:label];
    [label setFrame:CGRectMake(label.frame.origin.x, ((self.contentView.frame.size.height / 2) - (label.frame.size.height / 2)) - 1, label.frame.size.width, label.frame.size.height)];
    
    //create text input field
    UITextField *text = [[UITextField alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width * 0.3, 5, self.contentView.frame.size.width - (self.contentView.frame.size.width * 0.3), self.contentView.frame.size.height - 10)];
    [text setAdjustsFontSizeToFitWidth:true];
    [text setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [text setFont:[UIFont systemFontOfSize:[UIFont smallSystemFontSize]]];
    [text setBorderStyle:UITextBorderStyleNone];
    [text setSecureTextEntry:secureText];
    [text setClearButtonMode:UITextFieldViewModeAlways];
    [text setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [text setDelegate:self];
    [self.contentView addSubview:text];
    
    self.label = label;
    self.inputField = text;
    return self;
}

#pragma mark - Text Field delegates

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.callbackInputTextEdited != nil) {
        self.callbackInputTextEdited(textField.text);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.callbackInputReturnTapped != nil) {
        self.callbackInputReturnTapped(textField.text);
    }
    [textField resignFirstResponder];
    return true;
}

@end
