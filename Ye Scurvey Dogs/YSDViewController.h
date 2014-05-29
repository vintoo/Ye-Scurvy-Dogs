//
//  YSDViewController.h
//  Ye Scurvey Dogs
//
//  Created by Forrest Stewart on 5/8/14.
//  Copyright (c) 2014 8bitpirates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

#import "YSDcharacter.h"
#import "YSDBoss.h"

@interface YSDViewController : UIViewController <UIAlertViewDelegate>

{
    SystemSoundID PlaySoundID;
}

// pirate selection
@property (strong, nonatomic) IBOutlet UIView *pirateSelectView;

@property (strong, nonatomic) IBOutlet UIButton *outletSelectPirate1;
- (IBAction)selectPirate1ButtonPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *outletSelectPirate2;
- (IBAction)selectPirate2ButtonPressed:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *outletSelectPirate3;
- (IBAction)selectPirate3ButtonPressed:(UIButton *)sender;

// game instance variables
@property (nonatomic, readwrite) CGPoint currentPoint;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) YSDcharacter *character;
@property (strong, nonatomic) YSDBoss *boss;

// tile visitation
@property (nonatomic) BOOL haveVisitedTile0;
@property (nonatomic) BOOL haveVisitedTile1;
@property (nonatomic) BOOL haveVisitedTile2;
@property (nonatomic) BOOL haveVisitedTile3;

// character
@property (strong, nonatomic) IBOutlet UILabel *characterHealthScore;
@property (strong, nonatomic) IBOutlet UILabel *characterArmorType;
@property (strong, nonatomic) IBOutlet UILabel *characterDamageScore;
@property (strong, nonatomic) IBOutlet UILabel *characterWeaponType;
@property (strong, nonatomic) IBOutlet UIImageView *characterImageDefault;

// boss

// story
@property (strong, nonatomic) IBOutlet UILabel *storyText;

// action button
- (IBAction)storyActionButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *outletStoryActionButton;

// navigation buttons
- (IBAction)navigationButtonNorth:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *outletButtonNorth;

- (IBAction)navigationButtonEast:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *outletButtonEast;

- (IBAction)navigationButtonSouth:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *outletButtonSout;

- (IBAction)navigationButtonWest:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *outletButtonWest;

// background image
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

// tile background images
@property (strong, nonatomic) IBOutlet UIImageView *outletTile0;
@property (strong, nonatomic) IBOutlet UIImageView *outletTile1;
@property (strong, nonatomic) IBOutlet UIImageView *outletTile2;
@property (strong, nonatomic) IBOutlet UIImageView *outletTile3;
@property (strong, nonatomic) IBOutlet UIImageView *outletTile4;
@property (strong, nonatomic) IBOutlet UIImageView *outletTile5;
@property (strong, nonatomic) IBOutlet UIImageView *outletTile6;
@property (strong, nonatomic) IBOutlet UIImageView *outletTile7;
@property (strong, nonatomic) IBOutlet UIImageView *outletTile8;
@property (strong, nonatomic) IBOutlet UIImageView *outletTile9;
@property (strong, nonatomic) IBOutlet UIImageView *outletTile10;
@property (strong, nonatomic) IBOutlet UIImageView *outletTile11;

// reset button
- (IBAction)resetGameButton:(UIButton *)sender;


@end
