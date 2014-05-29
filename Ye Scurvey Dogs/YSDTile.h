//
//  YSDTile.h
//  Ye Scurvey Dogs
//
//  Created by Forrest Stewart on 5/10/14.
//  Copyright (c) 2014 8bitpirates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSDWeapon.h"
#import "YSDArmor.h"

@interface YSDTile : NSObject

@property (nonatomic) int tileNumber;

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) NSString *visitedStory;

@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) UIImage *visitedBackgroundImage;

@property (strong, nonatomic) NSString *actionButtonText;
@property (strong, nonatomic) NSString *visitedActionButtonText;

@property (strong, nonatomic) YSDWeapon *weapon;
@property (strong, nonatomic) YSDArmor *armor;

@property (nonatomic) int healthEffect;

@property (nonatomic) int damageEffect;

@property (nonatomic) BOOL isBossTile;

@property (nonatomic) BOOL haveVisitedTile;

@end
