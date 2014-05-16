//
//  PPAFilterController.m
//  PullPic
//
//  Created by JOHN YAM on 5/1/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "PPAFilterController.h"


@interface PPAFilterController ()

@property (nonatomic) NSString * currentFilter;

@end


@implementation PPAFilterController

{
    UIScrollView * scrollView;
    NSArray * filterNames;
    NSMutableArray * filterButtons;
    
    float wh;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.view.backgroundColor = [UIColor lightGrayColor];
        
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 100)];
        
        [self.view addSubview:scrollView];
        
        
        //making it mutable so we can add buttons to them and update the image of the buttons based on the photo and applied filter
        filterButtons = [@[] mutableCopy];
        
        filterNames = @[
                        //@"CIColorCrossPolynomial",
                        //@"CIColorCube",
                        @"CIColorCubeWithColorSpace",
                        @"CIColorInvert",
                        @"CIColorMap",
                        @"CIColorMonochrome",
                        @"CIColorPosterize",
                        @"CIFalseColor",
                        @"CIMaskToAlpha",
                        @"CIMaximumComponent",
                        @"CIMinimumComponent",
                        @"CIPhotoEffectChrome",
                        @"CIPhotoEffectFade",
                        @"CIPhotoEffectInstant",
                        @"CIPhotoEffectMono",
                        @"CIPhotoEffectNoir",
                        @"CIPhotoEffectProcess",
                        @"CIPhotoEffectTonal",
                        @"CIPhotoEffectTransfer",
                        @"CISepiaTone",
                        @"CIVignette",
                        @"CIVignetteEffect"
                        ];
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //have the height based on the VControllers view heigh
    wh = self.view.frame.size.height - 20;
    
    
    //now we have an array so we can do fast enumeration
    for (NSString * filterName in filterNames) {
        int i = (int)[filterNames indexOfObject:filterName];
        int x = (wh +10) * i +10;
        
        UIButton * filterButton = [[UIButton alloc]initWithFrame:CGRectMake(x, 10, wh, wh)];
        filterButton.tag = i;
       filterButton.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
        
        
        [filterButton addTarget:self action:@selector(switchFilter:) forControlEvents:UIControlEventTouchUpInside];
        
        [filterButtons addObject:filterButton];
        
        [scrollView addSubview:filterButton];
    }
    
    NSLog(@"%d", (int)self.view.frame.size.height);
    
    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    scrollView.contentSize = CGSizeMake((wh + 10) * [filterNames count] + 10, self.view.frame.size.height);
    
    
//    scrollView.pagingEnabled = YES;
//    scrollView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
//    scrollView.backgroundColor = [UIColor lightGrayColor];
//    
//    int filterCount = 20;
//    
//    for ( int i=0; i < filterCount; i++)
//    {
//        UIButton * filterButton = [[UIButton alloc]initWithFrame:CGRectMake((i* 90), 0, 80, 80)];
//        
//        filterButton.backgroundColor = [UIColor whiteColor];
//        
//        [filterButton addTarget:self action:@selector(applyFilter:) forControlEvents:UIControlEventTouchUpInside];
//        
//        [scrollView addSubview:filterButton];
//    }
//    
//    scrollView.contentSize = CGSizeMake(90 * filterCount, 80);
    
}



-(void)switchFilter:(UIButton*)filterButton
{
    int index = (int)filterButton.tag;
    
    NSLog(@"Switching to filter %@", filterNames[index]);
    
    self.currentFilter = [filterNames objectAtIndex:index];
    
    UIImage * image = [self filterImage: self.imageToFilter filterName:self.currentFilter];

    [self.delegate updateCurrentImageWithFilteredImage:image];
    
//    [self shrinkImage: self.imageToFilter maxWH:SCREEN_WIDTH * 2];
//    
//    [self filterImage:<#(UIImage *)#> filterName:self.currentFilter];
//    
//    [UIImage imageWithCGImage:(CGImageRef)];
}

- (UIImage *)shrinkImage:(UIImage *)image maxWH:(int)widthHeight
{
    CGSize size = CGSizeMake(widthHeight, widthHeight / image.size.width * image.size.height);
    
    if(image.size.height < image.size.width)
    {
        size = CGSizeMake(widthHeight / image.size.width * image.size.height, widthHeight);
    }
    
    UIGraphicsBeginImageContext(size); //based on size of scale down
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return destImage;
}

-(UIImage *)filterImage:(UIImage *)image filterName:(NSString *)filterName
{
    //UIimage comes with core image built in it
    //i want the data stored in the CGImage property to be able to convert it to a CIImage to be used with filters
    CIImage * ciImage = [CIImage imageWithCGImage:image.CGImage];
    
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    //put the CIImage for the key
    
    [filter setValue:ciImage forKeyPath:kCIInputImageKey];
    
    //rendering the CIImage. Not necessary, but using for optimization
    CIContext * ciContext = [CIContext contextWithOptions:nil];
    
    //the result image
    
    CIImage * ciResult = [filter valueForKeyPath:kCIOutputImageKey];
    
    //return the UIImage
    return [UIImage imageWithCGImage:[ciContext createCGImage:ciResult fromRect:[ciResult extent]]];
    
    // the line above is the same to the 4 lines below
    
//    CGRect rect = [ciResult extent];
//    CGImageRef CGImageRef = [ciContext createCGImage:ciResult fromRect:rect];
//    UIImage * uiImage= [UIImage imageWithCGImage:CGImageRef];
//    return uiImage;
    
}

- (void) setImageToFilter:(UIImage *)imageToFilter
{
    _imageToFilter = imageToFilter;
    
    for (UIButton * filterButton in filterButtons)
        
    {
        NSString * filterName = [filterNames objectAtIndex:filterButton.tag];
        
        //putting the filter process away from the main thread to prevent lagging. Assigning to an alternate thread
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, (unsigned long)
        NULL), ^{
            
            UIImage *smallImage = [self shrinkImage:imageToFilter maxWH:wh];
            
            UIImage * image = [self filterImage:smallImage filterName:filterName];
            
            
            //go back to the main thread an manipulate the buttons there. UIButton class is not thread safe
            dispatch_sync(dispatch_get_main_queue(), ^(void){
                [filterButton setImage:image forState:UIControlStateNormal];
                
                filterButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
            });
            
        });
        
    }
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

