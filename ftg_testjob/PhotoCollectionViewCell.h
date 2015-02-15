//
//  PhotoCollectionViewCell.h
//  ftg_testjob
//
//  Created by il.ya sald.in on 2/15/15.
//  Copyright (c) 2015 sald.in. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PhotoCellCloseButtonActionBlock)();

@interface PhotoCollectionViewCell : UICollectionViewCell

@property (weak) IBOutlet UIImageView *imgPhoto;
@property (weak) IBOutlet UIButton *btnRemovePhoto;

@property (copy) PhotoCellCloseButtonActionBlock actionBlock;

- (IBAction)removePhoto:(id)sender;

@end
