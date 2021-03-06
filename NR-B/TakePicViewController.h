//
//  ViewController.h
//  NR-B
//
//  Created by Chelsea Pugh on 1/17/15.
//  Copyright (c) 2015 chelsea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDTakeController.h"
#import <AVFoundation/AVFoundation.h>

@interface TakePicViewController : UIViewController <FDTakeDelegate>

@property FDTakeController *takeController;
- (IBAction)takePhotoOrChooseFromLibrary;
@property (strong, nonatomic) IBOutlet UIButton *takePicButton;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property(strong, nonatomic) AVCaptureStillImageOutput *stillImageOutput;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *readyButton;
@property (strong, nonatomic) IBOutlet UIView *previewView;

- (IBAction)redoPicture:(id)sender;
- (IBAction)submitPicture:(id)sender;

@end

