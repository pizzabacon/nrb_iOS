//
//  SendInfoViewController.h
//  NR-B
//
//  Created by Connie Qi on 1/17/15.
//  Copyright (c) 2015 chelsea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendInfoViewController : UIViewController<UIPickerViewDelegate>

@property (strong, nonatomic) NSMutableArray *issueNames;

@property (strong, nonatomic) IBOutlet UILabel *issueHeading;
@property (strong, nonatomic) IBOutlet UIPickerView *issuePicker;


@property (strong, nonatomic) IBOutlet UILabel *locationHeading;
@property (strong, nonatomic) IBOutlet UITextField *buildingTextField;
@property (strong, nonatomic) IBOutlet UITextField *roomTextField;

@property (strong, nonatomic) IBOutlet UILabel *detailsHeading;
@property (strong, nonatomic) IBOutlet UITextView *detailsTextView;

@property (strong, nonatomic) IBOutlet UIButton *sendButton;
@property (strong, nonatomic) UIView *inputAccView;

- (IBAction)sendPressed:(id)sender;

@end
