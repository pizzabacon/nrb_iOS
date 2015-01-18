//
//  SendInfoViewController.m
//  NR-B
//
//  Created by Connie Qi on 1/17/15.
//  Copyright (c) 2015 chelsea. All rights reserved.
//

#import "NRBColors.h"
#import "SendInfoViewController.h"


@implementation SendInfoViewController
NSInteger textViewMargin = 20;


- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger textViewWidth = self.view.frame.size.width - 2 * textViewMargin;
    
    _issueNames = [NSMutableArray arrayWithObjects:@"Energy waste", @"Maintenance request", @"Other", nil];
    
    // Style navigation bar
    self.navigationController.navigationBar.barTintColor = [UIColor greenSeaColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    // Background color
    self.view.backgroundColor = [UIColor turquoiseColor];
    
    // Issue type
    _issueHeading = [[UILabel alloc] initWithFrame:CGRectMake(textViewMargin, 60, textViewWidth, 40)];
    _issueHeading.text = @"Issue Type";
    _issueHeading.textColor = [UIColor whiteColor];
    [self.view addSubview:_issueHeading];
    
    _issuePicker = [[UIPickerView alloc] initWithFrame:CGRectMake(textViewMargin, 50, textViewWidth, 200)];
    _issuePicker.delegate = self;
    _issuePicker.showsSelectionIndicator = YES;
    _issuePicker.tintColor = [UIColor whiteColor];
    [self.view addSubview:_issuePicker];

    // Location header
    _locationHeading = [[UILabel alloc] initWithFrame:CGRectMake(textViewMargin, 180, textViewWidth, 40)];
    _locationHeading.text = @"Location";
    _locationHeading.textColor = [UIColor whiteColor];
    [self.view addSubview:_locationHeading];
    
    // Building text field
    _buildingTextField = [[UITextField alloc] initWithFrame:CGRectMake(textViewMargin, 220, textViewWidth, 40)];
    _buildingTextField.borderStyle = UITextBorderStyleRoundedRect;
    _buildingTextField.placeholder = @"Building";
    _buildingTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _buildingTextField.keyboardType = UIKeyboardTypeDefault;
    _buildingTextField.returnKeyType = UIReturnKeyDone;
    _buildingTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _buildingTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:_buildingTextField];
    
    // Room text field
    _roomTextField = [[UITextField alloc] initWithFrame:CGRectMake(textViewMargin, 260, textViewWidth, 40)];
    _roomTextField.borderStyle = UITextBorderStyleRoundedRect;
    _roomTextField.placeholder = @"Room";
    _roomTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    _roomTextField.keyboardType = UIKeyboardTypeDefault;
    _roomTextField.returnKeyType = UIReturnKeyDone;
    _roomTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _roomTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:_roomTextField];
    
    // Details
    _detailsHeading = [[UILabel alloc] initWithFrame:CGRectMake(textViewMargin, 300, textViewWidth, 40)];
    _detailsHeading.text = @"More Info (Optional)";
    _detailsHeading.textColor = [UIColor whiteColor];
    [self.view addSubview:_detailsHeading];
    
    _detailsTextView = [[UITextView alloc] initWithFrame:CGRectMake(textViewMargin, 340, textViewWidth, 100)];
    UIColor *borderColor = [UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0];
    
    _detailsTextView.layer.borderColor = borderColor.CGColor;
//    _detailsTextView.layer.borderWidth = 1.0;
    _detailsTextView.layer.cornerRadius = 5.0;
    [self.view addSubview:_detailsTextView];
    
    
    // Add send button
    _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sendButton setFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, 40.0f)];
    [_sendButton setTitle:@"Send" forState:UIControlStateNormal];
    [_sendButton addTarget:self action:@selector(sendPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.inputAccView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 310.0, 40.0)];
    [self.inputAccView setBackgroundColor:[UIColor clearColor]];
    [self.inputAccView setAlpha: 0.8];
    [self.view addSubview:_sendButton];
    [self.inputAccView addSubview:_sendButton];
    
    [self.view addSubview:self.inputAccView];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (IBAction)sendPressed:(id)sender {
    NSLog(@"send pressed");
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
}

// Tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_issueNames count];
}

// Tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// Tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_issueNames objectAtIndex:row];
}

// Tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    NSInteger textViewWidth = self.view.frame.size.width - 2 * textViewMargin;
    return textViewWidth;
}

// White text color
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = [_issueNames objectAtIndex:row];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
}

@end
