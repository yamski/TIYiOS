//
//  PPAPicViewController.m
//  PullPic
//
//  Created by JOHN YAM on 4/30/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "PPAPicRootViewController.h"

#import "PPAFilterController.h"


@interface PPAPicRootViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, PPAFilterControllerDelegate>

@property (nonatomic) UIImage * originalImage;

@end



@implementation PPAPicRootViewController

{
    UIImageView *imageView;
    PPAFilterController * filterVC;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:imageView];
    
    UIView * navBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    navBar.backgroundColor = [UIColor colorWithRed:0.776f green:0.635f blue:0.098f alpha:1.0f];;
    [self.view addSubview:navBar];
    
    UIButton * libraryButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    
    libraryButton.layer.cornerRadius = 15;
    libraryButton.backgroundColor = [UIColor whiteColor];
    
    [libraryButton addTarget:self action:@selector(choosePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    [navBar addSubview:libraryButton];
    
    
    filterVC = [[PPAFilterController alloc]initWithNibName:nil bundle:nil];
    
    filterVC.delegate  = self;
    
    filterVC.view.frame = CGRectMake(0, SCREEN_HEIGHT - 100, SCREEN_WIDTH, 100);
    
    [self.view addSubview:filterVC.view];
    

    
}


-(void)updateCurrentImageWithFilteredImage:(UIImage *)image
{
    imageView.image = image;
}

- (void)setOriginalImage:(UIImage *)originalImage
{
    _originalImage = originalImage;
    
    filterVC.imageToFilter = originalImage;
    imageView.image = originalImage;
    
}

-(void)choosePhoto
{
    UIImagePickerController * photoLibrary = [[UIImagePickerController alloc]init];
    photoLibrary.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    photoLibrary.allowsEditing = YES;
    
    photoLibrary.delegate= self;
    
    [self presentViewController:photoLibrary animated:YES completion:nil];
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@",info);
    
    self.originalImage = info[UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    
//    //First of all keep a copy of the original image orientation
//    //you’ll need it afterwards
//    UIImageOrientation originalOrientation = imageView.image.imageOrientation;
//    
//
//    
//    CIImage *inputImage = [[CIImage alloc] initWithCGImage:[imageView.image CGImage]];
//    
//    CIFilter *adjustmentFilter = [CIFilter filterWithName:@"CISepiaTone"];
//    [adjustmentFilter setDefaults];
//    [adjustmentFilter setValue:inputImage forKey:@"inputImage"];
//    [adjustmentFilter setValue:[NSNumber numberWithFloat:1.0f] forKey:@"inputIntensity"];
//    
//    // The output CIImage with the sepia effect applied
//    CIImage *outputImage = [adjustmentFilter valueForKey:@"outputImage"];
//    
//    //Create a CIContext
//    CIContext* context = [CIContext contextWithOptions:nil];
//    
//    //Create an CGImageRef from the output CIImage
//    CGImageRef imgRef = [context createCGImage:outputImage fromRect:outputImage.extent] ;
//    
//    // Create an UIImage from the CGImageRef object with scale = 1.0 and the orientation of the original image
//    UIImage* img = [[UIImage alloc] initWithCGImage:imgRef scale:1.0 orientation:originalOrientation];
//    
//    //Release the CGImageRef object
//    CGImageRelease(imgRef);
//    
//    //set the UIImage object to the UIImageView
//    imageView.image = img;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
