//
//  ViewController.m
//  NR-B
//
//  Created by Chelsea Pugh on 1/17/15.
//  Copyright (c) 2015 chelsea. All rights reserved.
//

#import "TakePicViewController.h"
#import <FDTake/FDTakeController.h>

@interface TakePicViewController ()

@end

@implementation TakePicViewController

- (IBAction)takePhotoOrChooseFromLibrary
{
    AVCaptureConnection *videoConnection = nil;
    for (AVCaptureConnection *connection in self.stillImageOutput.connections)
    {
        for (AVCaptureInputPort *port in [connection inputPorts])
        {
            if ([[port mediaType] isEqual:AVMediaTypeVideo] )
            {
                videoConnection = connection;
                break;
            }
        }
        if (videoConnection) { break; }
    }
    
    [self.stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler: ^(CMSampleBufferRef imageSampleBuffer, NSError *error)
     {
         NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
         UIImage *image = [[UIImage alloc] initWithData:imageData];
         
         self.imageView.image = image;
         [self.view addSubview:self.imageView];
         self.cancelButton.hidden = NO;
         self.readyButton.hidden = NO;
         self.takePicButton.hidden = YES;
         [self.previewView removeFromSuperview];
     }];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)setUpToTakePicture {
    [self.imageView removeFromSuperview];
    [self.view addSubview:self.previewView];
    
    [self.view bringSubviewToFront:self.cancelButton];
    [self.view bringSubviewToFront:self.readyButton];
    [self.view bringSubviewToFront:self.takePicButton];
    
    self.cancelButton.hidden = YES;
    self.readyButton.hidden = YES;
    self.takePicButton.hidden = NO;
    
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    session.sessionPreset = AVCaptureSessionPresetMedium;
    
    AVCaptureVideoPreviewLayer *captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    
    captureVideoPreviewLayer.frame = self.previewView.bounds;
    [self.previewView.layer addSublayer:captureVideoPreviewLayer];
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (!input) {
        // Handle the error appropriately.
        NSLog(@"ERROR: trying to open camera: %@", error);
    }
    [session addInput:input];
    
    [session startRunning];
    
    self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [self.stillImageOutput setOutputSettings:outputSettings];
    
    [session addOutput:self.stillImageOutput];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setUpToTakePicture];
    
}

- (void)viewDidUnload {
    [self setImageView:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)redoPicture:(id)sender {
    [self setUpToTakePicture];
}

- (IBAction)submitPicture:(id)sender {
}
@end
