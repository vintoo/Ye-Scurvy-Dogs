//
//  YSDcharacter.h
//  Ye Scurvey Dogs
//
//  Created by Forrest Stewart on 5/10/14.
//  Copyright (c) 2014 8bitpirates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSDArmor.h"
#import "YSDWeapon.h"

@interface YSDcharacter : NSObject

@property (strong, nonatomic) NSString *characterName;
@property (strong, nonatomic) YSDArmor *armor;
@property (strong, nonatomic) YSDWeapon *weapon;
@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (strong, nonatomic) UIImage *characterImageDefault;

@end
