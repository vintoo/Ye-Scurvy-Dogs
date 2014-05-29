//
//  YSDViewController.m
//  Ye Scurvey Dogs
//
//  Created by Forrest Stewart on 5/8/14.
//  Copyright (c) 2014 8bitpirates. All rights reserved.
//

#import "YSDViewController.h"
#import "YSDFactory.h"
#import "YSDTile.h"

@interface YSDViewController ()

@end

@implementation YSDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // create sound
    NSURL *soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"12345" ofType:@"m4a"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &PlaySoundID);
    
    [self prefersStatusBarHidden];
    
    // set up game
//    YSDFactory *factory = [[YSDFactory alloc] init];
//    self.tiles = [factory tiles];
//    self.character = [factory character];
//    self.boss = [factory boss];
//    
//    self.currentPoint = CGPointMake(0, 0);
//    
//    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
//    [self tileDidUpdate];
//    [self updateNavigationButtons];
    
}

// hide status bar
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

// Navigation button actions
- (IBAction)navigationButtonNorth:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y+1);
    
    [self updateNavigationButtons];
    [self tileDidUpdate];
}

- (IBAction)navigationButtonEast:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x+1, self.currentPoint.y);
    
    [self updateNavigationButtons];
    [self tileDidUpdate];
}

- (IBAction)navigationButtonSouth:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y-1);
    
    [self updateNavigationButtons];
    [self tileDidUpdate];
}

- (IBAction)navigationButtonWest:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x-1, self.currentPoint.y);
    
    [self updateNavigationButtons];
    [self tileDidUpdate];
}

// Reset button
- (IBAction)resetGameButton:(UIButton *)sender {
    
    // play sound
    AudioServicesPlaySystemSound(PlaySoundID);
    self.pirateSelectView.hidden = NO;
    [self setUpGame];
}

- (IBAction)storyActionButton:(UIButton *)sender {
    YSDTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    // if this is the boss tile, set up a fight
    if (tile.isBossTile == YES) {
        self.boss.bossHealth = self.boss.bossHealth - self.character.damage;
    }
    
    // update character stats
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    
    // are you dead?
    if (self.character.health < 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ye're dead, matey." message:@"Ye've died, ye scurvey dog. Reset and try yer luck anew." delegate:self cancelButtonTitle:@"Back" otherButtonTitles:@"Try yer luck again", nil];
        
        [alertView show];
    }
    else if (self.boss.bossHealth <0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ye've won, matey!" message:@"Ye've slain the Pirate Boss and emptied yer bladder on his corpse." delegate:self cancelButtonTitle:@"Back" otherButtonTitles:@"Full sail ahead!", nil];
        
        [alertView show];
    }
    
    // update character labels
    self.characterHealthScore.text = [NSString stringWithFormat:@"%i",self.character.health];
    self.characterArmorType.text = self.character.armor.armorName;
    self.characterDamageScore.text = [NSString stringWithFormat:@"%i",self.character.damage];
    self.characterWeaponType.text = self.character.weapon.weaponName;
    
    //[self tileDidUpdate];
    //self.outletStoryActionButton.hidden = YES;
    [self updateNavigationButtons];
}

// select pirate buttons
- (IBAction)selectPirate1ButtonPressed:(UIButton *)sender {
    self.pirateSelectView.hidden = YES;
    YSDFactory *factory = [[YSDFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character1];
    self.boss = [factory boss];
    [self setUpGame];
}
- (IBAction)selectPirate2ButtonPressed:(UIButton *)sender {
    self.pirateSelectView.hidden = YES;
    YSDFactory *factory = [[YSDFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character2];
    self.boss = [factory boss];
    [self setUpGame];
}
- (IBAction)selectPirate3ButtonPressed:(UIButton *)sender {
    self.pirateSelectView.hidden = YES;
    YSDFactory *factory = [[YSDFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character3];
    self.boss = [factory boss];
    [self setUpGame];
}

#pragma mark - Helper Methods

- (void) tileDidUpdate {
    YSDTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    // disable navigation
   // self.outletButtonWest.enabled = NO;
    //self.outletButtonEast.enabled = NO;
    //self.outletButtonNorth.enabled = NO;
    //self.outletButtonSout.enabled = NO;
    
    if (tileModel.haveVisitedTile != YES) {
        
        // update story and background
        self.storyText.text = tileModel.story;
        self.backgroundImage.image = tileModel.backgroundImage;
        
        // remove fog of war from visited tiles
        if (self.currentPoint.x == 0 && self.currentPoint.y == 0) {
            self.outletTile0.image = tileModel.visitedBackgroundImage;
        }
        else if (self.currentPoint.x == 0 && self.currentPoint.y == 1) {
            self.outletTile1.image = tileModel.visitedBackgroundImage;
        }
        else if (self.currentPoint.x == 0 && self.currentPoint.y == 2) {
            self.outletTile2.image = tileModel.visitedBackgroundImage;
        }
        else if (self.currentPoint.x == 1 && self.currentPoint.y == 0) {
            self.outletTile3.image = tileModel.visitedBackgroundImage;
        }
        else if (self.currentPoint.x == 1 && self.currentPoint.y == 1) {
            self.outletTile4.image = tileModel.visitedBackgroundImage;
        }
        else if (self.currentPoint.x == 1 && self.currentPoint.y == 2) {
            self.outletTile5.image = tileModel.visitedBackgroundImage;
        }
        else if (self.currentPoint.x == 2 && self.currentPoint.y == 0) {
            self.outletTile6.image = tileModel.visitedBackgroundImage;
        }
        else if (self.currentPoint.x == 2 && self.currentPoint.y == 1) {
            self.outletTile7.image = tileModel.visitedBackgroundImage;
        }
        else if (self.currentPoint.x == 2 && self.currentPoint.y == 2) {
            self.outletTile8.image = tileModel.visitedBackgroundImage;
        }
        else if (self.currentPoint.x == 3 && self.currentPoint.y == 0) {
            self.outletTile9.image = tileModel.visitedBackgroundImage;
        }
        else if (self.currentPoint.x == 3 && self.currentPoint.y == 1) {
            self.outletTile10.image = tileModel.visitedBackgroundImage;
        }
        else if (self.currentPoint.x == 3 && self.currentPoint.y == 2) {
            self.outletTile11.image = tileModel.visitedBackgroundImage;
        }
        
        tileModel.haveVisitedTile = YES;
    }
    else {
        // update story and background with visited versions
        self.storyText.text = tileModel.visitedStory;
        self.backgroundImage.image = tileModel.backgroundImage;
    }
    
    // set action button title
    if (tileModel.actionButtonText != nil) {
        [self.outletStoryActionButton setTitle:tileModel.actionButtonText forState:UIControlStateNormal];
        self.outletStoryActionButton.hidden = NO;
    }
    else {
        self.outletStoryActionButton.hidden = YES;
    }
    
}

-(void) updateNavigationButtons {
    self.outletButtonWest.enabled = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x-1, self.currentPoint.y)];
    self.outletButtonEast.enabled = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x+1, self.currentPoint.y)];
    self.outletButtonNorth.enabled = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y+1)];
    self.outletButtonSout.enabled = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y-1)];
}

- (BOOL) tileExistsAtPoint:(CGPoint)point {
    if(point.y >=0 && point.x >=0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]){
        return YES;
    }
    else {
        return NO;
    }
}

-(void) updateCharacterStatsForArmor:(YSDArmor *)armor withWeapons:(YSDWeapon *)weapon withHealthEffect:(int)healthEffect {
    if (armor!=nil) {
        self.character.health = self.character.health - self.character.armor.armorValue + armor.armorValue;
        self.character.armor = armor;
    }
    else if (weapon !=nil) {
        self.character.damage = self.character.damage - self.character.weapon.weaponDamage + weapon.weaponDamage;
        self.character.weapon = weapon;
    }
    else if (healthEffect !=0) {
        self.character.health = self.character.health + healthEffect;
    }
    else {
        self.character.health = self.character.health + self.character.armor.armorValue;
        self.character.damage = self.character.damage + self.character.weapon.weaponDamage;
        
        // update character image
        //self.characterImageDefault.image = self.character.characterImageDefault;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Try yer luck again"])
    {
        [self setUpGame];
    }
    else if([title isEqualToString:@"Continue"])
    {
        NSLog(@"Button 2 was selected.");
    }
    else if([title isEqualToString:@"Button 3"])
    {
        NSLog(@"Button 3 was selected.");
    }
}

- (void) setUpGame {
    // set up game
    self.currentPoint = CGPointMake(0, 0);
    
    self.characterImageDefault.image = self.character.characterImageDefault;
    //self.characterHealthScore.text = self.character.health;
    
    [self.characterHealthScore setText:[NSString stringWithFormat:@"%d", self.character.health]];
    [self.characterDamageScore setText:[NSString stringWithFormat:@"%d", self.character.damage]];
    
    //[self updateCharacterStatsForArmor:nil withWeapons:nil withHealthEffect:0];
    [self tileDidUpdate];
    [self updateNavigationButtons];
    
    [self resetTileImages];
}

- (void) resetTileImages {
    [self.outletTile1 setImage:[UIImage imageNamed: @"tileFog.png"]];
    [self.outletTile2 setImage:[UIImage imageNamed: @"tileFog.png"]];
    [self.outletTile3 setImage:[UIImage imageNamed: @"tileFog.png"]];
    [self.outletTile4 setImage:[UIImage imageNamed: @"tileFog.png"]];
    [self.outletTile5 setImage:[UIImage imageNamed: @"tileFog.png"]];
    [self.outletTile6 setImage:[UIImage imageNamed: @"tileFog.png"]];
    [self.outletTile7 setImage:[UIImage imageNamed: @"tileFog.png"]];
    [self.outletTile8 setImage:[UIImage imageNamed: @"tileFog.png"]];
    [self.outletTile9 setImage:[UIImage imageNamed: @"tileFog.png"]];
    [self.outletTile10 setImage:[UIImage imageNamed: @"tileFog.png"]];
    [self.outletTile11 setImage:[UIImage imageNamed: @"tileFog.png"]];
}

@end
