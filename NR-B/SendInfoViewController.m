//
//  SendInfoViewController.m
//  NR-B
//
//  Created by Connie Qi on 1/17/15.
//  Copyright (c) 2015 chelsea. All rights reserved.
//

#import "SendInfoViewController.h"

@implementation SendInfoViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Issue type

    // Building text field
    _buildingTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 200, 300, 40)];
    _buildingTextField.borderStyle = UITextBorderStyleRoundedRect;
    _buildingTextField.font = [UIFont systemFontOfSize:15];
    _buildingTextField.placeholder = @"Building";
    _buildingTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _buildingTextField.keyboardType = UIKeyboardTypeDefault;
    _buildingTextField.returnKeyType = UIReturnKeyDone;
    _buildingTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _buildingTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:_buildingTextField];
    
    // Room text field
    _roomTextField = [[UITextField alloc] initWithFrame:CGRectMake(5, 240, 300, 40)];
    _roomTextField.borderStyle = UITextBorderStyleRoundedRect;
    _roomTextField.font = [UIFont systemFontOfSize:15];
    _roomTextField.placeholder = @"Room";
    _roomTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _roomTextField.keyboardType = UIKeyboardTypeDefault;
    _roomTextField.returnKeyType = UIReturnKeyDone;
    _roomTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _roomTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:_roomTextField];
    
    // Details
    _detailsTextView = [[UITextView alloc] initWithFrame:CGRectMake(5, 300, 300, 100)];
    _detailsTextView.layer.cornerRadius = 5.0;
    _detailsTextView.font = [UIFont systemFontOfSize:15];
    _detailsTextView.clipsToBounds = YES;
    [self.view addSubview:_detailsTextView];
    [_detailsTextView sizeToFit];
    
    
    // Add send button
    _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sendButton setFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 40.0f)];
    [_sendButton setTitle:@"Send" forState:UIControlStateNormal];
    [_sendButton addTarget:self action:@selector(sendPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.inputAccView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 310.0, 40.0)];
    [self.inputAccView setBackgroundColor:[UIColor clearColor]];
    [self.inputAccView setAlpha: 0.8];
    [self.inputAccView addSubview:_sendButton];

}

- (IBAction)sendPressed:(id)sender {
    NSLog(@"send pressed");
}

@end
