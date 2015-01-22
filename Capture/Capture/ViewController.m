//
//  ViewController.m
//  Capture
//
//  Created by Jide Opeola on 1/20/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "ViewController.h"
#import "FilterViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic) UIImagePickerController *cameraPickerController;
@property (nonatomic) UIImagePickerController *libraryPickerController;

@property (weak, nonatomic) IBOutlet UIButton *openPhotoLibraryButton;

@property (weak, nonatomic) IBOutlet UIButton *takeMediaButton;

@property (weak, nonatomic) IBOutlet UIView *cameraView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *mediaChoiceButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *cameraSelect;

@property (strong, nonatomic) NSURL *videoURL;

@property (strong, nonatomic) MPMoviePlayerController *videoController;

//@property (strong, nonatomic) NSURL *videoURL;

//@property (strong, nonatomic) MPMoviePlayerController *videoController;

@end

@implementation ViewController

{
    UIImage *btnImage;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.pickerController = [[UIImagePickerController alloc] init];
//    self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    [self.view addSubview:self.pickerController.view];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    
    
    
    
    
    [self.openPhotoLibraryButton addTarget:self action:@selector(openPhotoLibrary) forControlEvents:UIControlEventTouchUpInside];
    
    self.cameraPickerController = [[UIImagePickerController alloc]init];
    self.cameraPickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.cameraPickerController.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    self.cameraPickerController.showsCameraControls = NO;
    self.cameraPickerController.delegate = self;
    
    //toggle between photo and video
    self.cameraPickerController.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie];
    
    self.cameraPickerController.view.frame = self.cameraView.bounds;
    
    [self.cameraView addSubview:self.cameraPickerController.view];
    
    
    // second self below is the object, and after action is the method
    [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
    
    [self.mediaChoiceButton addTarget:self action:@selector(changeMediaType) forControlEvents:UIControlEventValueChanged];
    
    //deviceChoiceButton
    
    [self.cameraSelect addTarget:self action:@selector(changeCameraType) forControlEvents:UIControlEventValueChanged];
    
}


//-(void)takeMedia {
//    
//    [self.cameraPickerController takePicture];
//    
//}

-(void)changeCameraType {
    
    self.cameraPickerController.cameraDevice = (self.cameraSelect.selectedSegmentIndex == 0) ? UIImagePickerControllerCameraDeviceFront : UIImagePickerControllerCameraDeviceRear;
    
    
}


-(void)changeMediaType {
    
    // if ? then : else
    
    self.cameraPickerController.cameraCaptureMode = (self.mediaChoiceButton.selectedSegmentIndex == 0) ? UIImagePickerControllerCameraCaptureModePhoto: UIImagePickerControllerCameraCaptureModeVideo;
    
    switch (self.mediaChoiceButton.selectedSegmentIndex) {
        case 0: // photo
            
            [self.mediaChoiceButton addTarget:self action:@selector(changeMediaType) forControlEvents:UIControlEventValueChanged];
            
                [self.takeMediaButton addTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
            
            btnImage = [UIImage imageNamed:@"instagram15.png"];
            
            self.takeMediaButton.layer.cornerRadius = 0;
            self.takeMediaButton.layer.masksToBounds = YES;
            
            [self.takeMediaButton setImage:btnImage forState:UIControlStateNormal];
            
            self.takeMediaButton.backgroundColor = [UIColor clearColor];

            
            break;
        case 1: // video
            
            
            btnImage = [UIImage imageNamed:@""];
        [self.takeMediaButton setImage:btnImage forState:UIControlStateNormal];
     
            
            self.takeMediaButton.backgroundColor = [UIColor redColor];
            
            self.takeMediaButton.layer.cornerRadius = 65/2;
            self.takeMediaButton.layer.masksToBounds = YES;
            
           [self.view addSubview:self.takeMediaButton];

            
            
            
            
            [self.takeMediaButton removeTarget:self.cameraPickerController action:@selector(takePicture) forControlEvents:UIControlEventTouchUpInside];
            
            [self.takeMediaButton addTarget:self action:@selector(captureVideo) forControlEvents:UIControlEventTouchUpInside];
            
            
            
            
            break;
            
            
        default:
            
            
            break;
    }

    
}

-(void)captureVideo {
    
  //  self.cameraPickerController.allowsEditing = NO;
if (self.mediaChoiceButton.selectedSegmentIndex == 1) {
    [self.cameraPickerController startVideoCapture];
    
    self.takeMediaButton.layer.cornerRadius = 0;
    self.takeMediaButton.layer.masksToBounds = YES;
    [self.view addSubview:self.takeMediaButton];
    

}
    
}

-(void)openPhotoLibrary {
    
    self.libraryPickerController = [[UIImagePickerController alloc] init];
    
    //  you could tell it what to do because you know who it is, but it doesnt know who you are..here you are telling it who you are 
    self.libraryPickerController.delegate = self;
    
    [self presentViewController:self.libraryPickerController animated:YES completion:nil];
    
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
  //  NSLog(@"%@",info);
    
    if (self.mediaChoiceButton.selectedSegmentIndex == 0) {
        
        UIImage * image = info[UIImagePickerControllerOriginalImage];
        
        [self gotoFilterWithImage:image];
        
        [picker dismissViewControllerAnimated:YES completion:^{
            
        }];
    } else {
        
        self.videoURL = info[UIImagePickerControllerMediaURL];
        
        [self gotoFilterWithVideo:self.videoURL];
        
        [picker dismissViewControllerAnimated:YES completion:NULL];
        
        
        
        
   //     [self.videoController.view setFrame:CGRectMake (0, 0, 320, 460)];
    //    [self.view addSubview:self.videoController.view];

        
    }
    

    
}

-(void)gotoFilterWithVideo:(NSURL *)videoURL {
    
    self.videoController = [[MPMoviePlayerController alloc] init];
    
    [self.videoController setContentURL:self.videoURL];
    
    FilterViewController * filterVC = [self.storyboard instantiateViewControllerWithIdentifier:@"filterVC"];
    
    [self.navigationController pushViewController:filterVC animated:YES];
    
    [filterVC.view addSubview:self.videoController.view];
    
    [self.videoController play];
    
}

-(void)gotoFilterWithImage:(UIImage *)image {
    
    // push filter view controller
    
 
    
    FilterViewController * filterVC = [self.storyboard instantiateViewControllerWithIdentifier:@"filterVC"];
    
    filterVC.originalImage = image;
    
    
        [self.navigationController pushViewController:filterVC animated:YES];
        
 
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
