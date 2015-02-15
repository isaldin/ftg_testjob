//
//  ViewController.m
//  ftg_testjob
//
//  Created by il.ya sald.in on 2/15/15.
//  Copyright (c) 2015 sald.in. All rights reserved.
//

#import "ViewController.h"

#import "PhotoCollectionViewCell.h"

#import "APIClient.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *arrPickedPhotos;

@property (strong) UIImagePickerController *pickerAvatar;
@property (strong) UIImagePickerController *pickerPhotos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.arrPickedPhotos = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark avatar actions
- (IBAction)changeAvatar:(id)sender
{
    self.pickerAvatar = [[UIImagePickerController alloc] init];
    self.pickerAvatar.delegate = self;
    self.pickerAvatar.allowsEditing = YES;
    self.pickerAvatar.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:self.pickerAvatar animated:YES completion:NULL];
}

- (IBAction)deleteAvatar:(id)sender
{
    self.imgAvatar.image = nil;
}

#pragma mark add photo button action
- (IBAction)addPhoto:(id)sender
{
    self.pickerPhotos = [[UIImagePickerController alloc] init];
    self.pickerPhotos.delegate = self;
    self.pickerPhotos.allowsEditing = YES;
    self.pickerPhotos.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:self.pickerPhotos animated:YES completion:NULL];
}

#pragma mark uiimagepicker delegate methods
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if([picker isKindOfClass:self.pickerAvatar.class])
    {
        UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
        self.imgAvatar.image = chosenImage;
        
        [picker dismissViewControllerAnimated:YES completion:NULL];
    }
    else
    {
        [self.arrPickedPhotos addObject:info[UIImagePickerControllerEditedImage]];
        
        [picker dismissViewControllerAnimated:YES completion:^{
            [self.collectionPhotos reloadData];
        }];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

#pragma mark photos collection delegate and datasource methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [self.arrPickedPhotos count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCellReuseID" forIndexPath:indexPath];
    
    cell.imgPhoto.image = self.arrPickedPhotos[indexPath.row];
    cell.actionBlock = ^{
        [self.arrPickedPhotos removeObjectAtIndex:indexPath.row];
        [self.collectionPhotos reloadData];
    };
    return cell;
    
}

#pragma mark -- create event
- (IBAction)postEvent:(id)sender
{
    [self btnActionPostEvent];
}

- (void)btnActionPostEvent
{
    NSDictionary *params = @{@"event":
                                 @{
                                     @"title": self.txtName.text,
                                     @"tags": @[
                                              @{
                                                  @"tag": @"Deep House"
                                              },
                                              @{
                                                  @"tag": @"Free entrance"
                                              }
                                              ],
                                     @"description": @"In a mobile #iOS #application, users expect your apps to respond...",
                                     @"coordinates": @"50.035895,36.234747",
                                     @"date_start": @"2014-04-14T02:15:15+000000",
                                     @"date_end": @"2015-04-14T05:18:15+000000",
                                     @"privacy" : @"all"
                                 }};
    
    [[APIClient sharedClient] postEventInfo:params];
}

#pragma mark --

@end
