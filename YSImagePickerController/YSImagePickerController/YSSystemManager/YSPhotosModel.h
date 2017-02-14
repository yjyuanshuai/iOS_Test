//
//  YSPhotosModel.h
//  YSImagePickerController
//
//  Created by YJ on 17/2/14.
//  Copyright © 2017年 YJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSPhotosModel : NSObject

@property (nonatomic, strong) id asset;
@property (nonatomic, assign) BOOL isSelected;



@end


@interface YSAlbumsModel : NSObject

@property (nonatomic, copy) NSString * name;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) id albumPhotos;   // PHFetchResult<PHAsset> 或 ALAssetsGroup<ALAsset>

@property (nonatomic, assign) NSUInteger selectedCount;
@property (nonatomic, strong) NSMutableArray * selectedMedias;
@property (nonatomic, strong) NSMutableArray * allMedias;

@end
