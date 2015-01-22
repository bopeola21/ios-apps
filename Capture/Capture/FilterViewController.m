//
//  FilterViewController.m
//  Capture
//
//  Created by Jide Opeola on 1/20/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

#import "FilterViewController.h"
#import "FilterCell.h"
#import "SlickSlider.h"
// add segment control for choosing front or rear camera
    // add target method that changes the camera device

// add methods to allow for video capture and stopping

// add a UICollectionView to filterVC (storyboard) at the bottom
    // take inspiration from instagram filter scroller (1 row of square filters)


//extra :find out how to flip camera view when changing between front and rear

@interface FilterViewController () <UICollectionViewDataSource, UICollectionViewDelegate, SlickSliderDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *filterImageView;

@property (weak, nonatomic) IBOutlet UICollectionView *filterCollectionView;

@property (weak, nonatomic) IBOutlet SlickSlider *slider1;

@property (nonatomic) NSArray * filters;

@end

@implementation FilterViewController

-(void)setOriginalImage:(UIImage *)originalImage {
    
    
    
    _originalImage = originalImage;
    
    self.filterImageView.image = originalImage;
    
}

-(void)sliderDidFinishUpdatingWithValue:(float)value {
    
    NSLog(@"slider is %f",value);
    
}

- (UIImage *)resizeImage:(UIImage *)originalImage withSize:(CGSize) size {
    
    float scale = (originalImage.size.height > originalImage.size.width) ? size.width / originalImage.size.width : size.height / originalImage.size.height;
    
    CGSize ratioSize = CGSizeMake(originalImage.size.width * scale, originalImage.size.height * scale);
    
    UIGraphicsBeginImageContextWithOptions(ratioSize, NO, 0.0);
    
    [originalImage drawInRect:CGRectMake(0, 0, ratioSize.width, ratioSize.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}


//method first * is method name, second * is the first parameter, second method name, third * is the second parameter
-(UIImage *)filterImage:(UIImage *)originalImage withFilterName:(NSString *)filterName {
    
    CIContext * context = [CIContext contextWithOptions:nil];
    
 //   CIImage * inputImage = originalImage.CIImage;
    
    CIImage * inputImage = [[CIImage alloc] initWithCGImage:originalImage.CGImage];
    
    //NSLog(@"%@",inputImage);
    
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    
    [filter setValue:inputImage forKey:kCIInputImageKey];
    
    //[filter setValue:@80 forKey:kCIInputScaleKey];
    
    // k - key C - core I - image
    CIImage * result = [filter valueForKey:kCIOutputImageKey];
    
    CGRect rect = [result extent];
    
    
    // transforms to CIimage to a cgimage, and gets size from rect
    CGImageRef cgImage = [context createCGImage:result fromRect:rect];
    
   // return [UIImage imageWithCGImage:cgImage];
    
    return [UIImage imageWithCGImage:cgImage scale:originalImage.scale orientation:originalImage.imageOrientation];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  //  self.filterImageView.image = self.originalImage;
    
    self.filters = [CIFilter filterNamesInCategory:kCICategoryColorEffect];
    
    self.filterCollectionView.delegate = self;
    self.filterCollectionView.dataSource = self;
    
    
    self.filterImageView.image = [self filterImage:self.originalImage withFilterName:self.filters[0]];
    
    self.slider1.delegate = self;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.filters.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FilterCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"filterCell" forIndexPath:indexPath];
    
    NSString * filterName = self.filters[indexPath.item];
    
    // get side thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        
        
        UIImage * resizedImage = [self resizeImage:self.originalImage withSize:cell.imageView.frame.size];
        
    // changed from self.originalImage to resizedImage
        
//            UIImage * filterImage = [self filterImage:self.originalImage withFilterName:filterName];
        
         UIImage * filterImage = [self filterImage:resizedImage withFilterName:filterName];
        
        // get main thread
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            cell.imageView.image = filterImage;
        });
        
    });
   
   
    
    
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * filterName = self.filters[indexPath.item];
    
    UIImage * resizedImage = [self resizeImage:self.originalImage withSize:self.filterImageView.frame.size];
    
    UIImage * filterImage = [self filterImage:resizedImage withFilterName:filterName];
    
    self.filterImageView.image = filterImage;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
