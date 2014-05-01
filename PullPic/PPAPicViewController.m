//
//  PPAPicViewController.m
//  PullPic
//
//  Created by JOHN YAM on 4/30/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "PPAPicViewController.h"

@interface PPAPicViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation PPAPicViewController
{
    UIImageView *imageView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
        
        imageView.contentMode = UIViewContentModeScaleToFill;
        
        [self.view addSubview:imageView];
        
        UIView * navBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        navBar.backgroundColor = [UIColor colorWithRed:0.776f green:0.635f blue:0.098f alpha:1.0f];;
        [self.view addSubview:navBar];
        
        UIButton * libraryButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
        
        libraryButton.layer.cornerRadius = 15;
        libraryButton.backgroundColor = [UIColor whiteColor];
        
        [libraryButton addTarget:self action:@selector(choosePhoto) forControlEvents:UIControlEventTouchUpInside];
        
        [navBar addSubview:libraryButton];
        
        
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0,SCREEN_HEIGHT - 100, SCREEN_WIDTH, 100)];
        
        scroll.pagingEnabled = YES;
        scroll.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
        scroll.backgroundColor = [UIColor lightGrayColor];
        
        [self.view addSubview:scroll];
        
        int filterCount = 20;
        
        for ( int i=0; i < filterCount; i++)
            {
        
                UIView * squares = [[UIView alloc]initWithFrame:CGRectMake((i* 90), 0, 80, 80)];
                
                squares.backgroundColor = [UIColor whiteColor];
            

                
                [scroll addSubview:squares];
            }
        
        scroll.contentSize = CGSizeMake(90 * filterCount, 80);
    
    }
    return self;
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
    
    imageView.image = info[UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   

    
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
