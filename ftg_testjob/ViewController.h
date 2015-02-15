//
//  ViewController.h
//  ftg_testjob
//
//  Created by il.ya sald.in on 2/15/15.
//  Copyright (c) 2015 sald.in. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate>


@property (weak) IBOutlet UITextField *txtName;
@property (weak) IBOutlet UIImageView *imgAvatar;

- (IBAction)deleteAvatar:(id)sender;
- (IBAction)changeAvatar:(id)sender;

- (IBAction)addPhoto:(id)sender;

@end

