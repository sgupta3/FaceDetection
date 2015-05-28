//
//  ViewController.m
//  FaceDetection
//
//  Created by Sahil Gupta on 2015-05-28.
//  Copyright (c) 2015 SahilGupta. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.image = [UIImage imageNamed:@"two_people.jpeg"];
    [self markFaces:self.imageView.image];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)markFaces:(UIImage *)facePicture
{
    CIImage* image = [CIImage imageWithCGImage:facePicture.CGImage];
    CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:[NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy]];
    
    NSArray* features = [detector featuresInImage:image];
    
    NSLog(@"Faces detected: %lu ",(unsigned long)[features count]);
}

@end
