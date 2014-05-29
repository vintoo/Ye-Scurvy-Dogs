//
//  YSDFactory.m
//  Ye Scurvey Dogs
//
//  Created by Forrest Stewart on 5/10/14.
//  Copyright (c) 2014 8bitpirates. All rights reserved.
//

#import "YSDFactory.h"
#import "YSDTile.h"
#import "YSDcharacter.h"

@implementation YSDFactory

-(NSArray *)tiles {
    
    // Tile 0,0
    YSDTile *tile0 = [[YSDTile alloc] init];
    //tile0.story = @"There's no retreat, lad... only revenge or death's cold embrace.";
    tile0.story = @"Ye have escaped the mighty kraken and set boots on land, revenge in yer cold heart. Set a course to the Pirate King.";
    tile0.visitedStory =@"There's no turnin' back now. Yer ship is smashed ta bits and ye've no way to go but ahead.";
    tile0.backgroundImage = [UIImage imageNamed:@"YeScurveyDogs-0.png"];
    tile0.visitedBackgroundImage = [UIImage imageNamed:@"tileNoFog.png"];
    tile0.actionButtonText = nil;

        // tile health effect
        tile0.healthEffect = 0;
    
    // Tile 0,1
    YSDTile *tile1 = [[YSDTile alloc] init];
    tile1.story = @"Stay out of the water, ye idiot! The kraken is a vicious beast, hungry for oily buccaneers like yerself.";
    tile1.visitedStory = @"Stay out of the water, ye idiot! The kraken is a vicious beast, hungry for oily buccaneers like yerself.";
    tile1.backgroundImage = [UIImage imageNamed:@"YeScurveyDogs-1.png"];
    tile1.visitedBackgroundImage = [UIImage imageNamed:@"tileNoFog.png"];
    tile1.actionButtonText = @"Continue";
    tile1.visitedActionButtonText = @"Continue";
    
        // tile health effect
        tile1.healthEffect = -3;
    
    // Tile 0,2
    YSDTile *tile2 = [[YSDTile alloc] init];
    tile2.story = @"Ye've entered a bone yard, rife with the corpses of fallen sea scum. Amidst the bodies, ye find a heavy pistol.";
    tile2.visitedStory = @"No more pistols here, me boy. Only corpses. Carry on if'n ye want to avoid becomin' one yerself.";
    tile2.backgroundImage = [UIImage imageNamed:@"YeScurveyDogs-2.png"];
    tile2.visitedBackgroundImage = [UIImage imageNamed:@"tileNoFog.png"];
    tile2.actionButtonText = @"Take the pistol";
    tile2.visitedActionButtonText = nil;
    
        // tile weapon effect
        YSDWeapon *pistol = [[YSDWeapon alloc] init];
        pistol.weaponName = @"Pistol (+30)";
        pistol.weaponDamage = 30;
        tile2.weapon = pistol;
    
        // tile health effect
        tile2.healthEffect = 0;
    
    // build column 1
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile0];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    
    // Tile 1,0
    YSDTile *tile3 = [[YSDTile alloc] init];
    tile3.story = @"The desert stretches ahead of ye. Sand blows over the dunes, batterin' yer oily hide and scortchin' yer eyes.";
    tile3.visitedStory = @"The desert stretches ahead of ye. Sand blows over the dunes, batterin' yer oily hide and scortchin' yer eyes.";
    tile3.backgroundImage = [UIImage imageNamed:@"YeScurveyDogs-3.png"];
    tile3.visitedBackgroundImage = [UIImage imageNamed:@"tileNoFog.png"];
    tile3.actionButtonText = @"Forge ahead";
    tile3.visitedActionButtonText = @"Forge ahead";
    
        // tile health effect
        tile3.healthEffect = -2;
    
    // Tile 1,1
    YSDTile *tile4 = [[YSDTile alloc] init];
    tile4.story = @"A magic parrot alights on yer shoulder. The beast is loyal, and will suffer damage on yer behalf if trouble seeks ye out.";
    tile4.visitedStory = @"Ye slipped on magic parrot droppings and are humiliated, but otherwise undamaged";
    tile4.backgroundImage = [UIImage imageNamed:@"YeScurveyDogs-4.png"];
    tile4.visitedBackgroundImage = [UIImage imageNamed:@"tileNoFog.png"];
    tile4.actionButtonText = @"Feed the magic parrot";
    tile4.visitedActionButtonText = @"Brush yerself off";
    
        // tile armor effect
        YSDArmor *magicParrot = [[YSDArmor alloc] init];
        magicParrot.armorName = @"Parrot (+15)";
        magicParrot.armorValue = 15;
        tile4.armor = magicParrot;
    
        // tile health effect
        tile4.healthEffect = 0;
    
    // Tile 1,2
    YSDTile *tile5 = [[YSDTile alloc] init];
    tile5.story = @"On the road, ye come across a lady of the evenin'. Her ministrations sooth yer body, but yer will to fight is lessened.";
    tile5.backgroundImage = [UIImage imageNamed:@"YeScurveyDogs-5.png"];
    tile5.visitedBackgroundImage = [UIImage imageNamed:@"tileNoFog.png"];
    tile5.actionButtonText = @"Linger with the lady";
    
        // tile health effect
        tile5.healthEffect = 5;
    
    // build column 2
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile3];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    
    // Tile 2,0
    YSDTile *tile6 = [[YSDTile alloc] init];
    tile6.story = @"Treadin' through the desert is an ill-conceived route. The heat, wind, and sand singe ye to the bone.";
    tile6.visitedStory = @"Treadin' through the desert is an ill-conceived route. The heat, wind, and sand singe ye to the bone.";
    tile6.backgroundImage = [UIImage imageNamed:@"YeScurveyDogs-6.png"];
    tile6.visitedBackgroundImage = [UIImage imageNamed:@"tileNoFog.png"];
    tile6.actionButtonText = @"Push on";
    tile6.visitedActionButtonText = @"Push on";
    
        // tile health effect
        tile6.healthEffect = -5;
    
    // Tile 2,1
    YSDTile *tile7 = [[YSDTile alloc] init];
    tile7.story = @"This is the tile 7 story";
    tile7.backgroundImage = [UIImage imageNamed:@"YeScurveyDogs-7.png"];
    tile7.visitedBackgroundImage = [UIImage imageNamed:@"tileNoFog.png"];
    tile7.actionButtonText = @"Ye went north, 1,2.";
    
        // tile health effect
        tile7.healthEffect = 0;
    
    // Tile 2,2
    YSDTile *tile8 = [[YSDTile alloc] init];
    tile8.story = @"This is the tile 8 story";
    tile8.backgroundImage = [UIImage imageNamed:@"YeScurveyDogs-8.png"];
    tile8.visitedBackgroundImage = [UIImage imageNamed:@"tileNoFog.png"];
    tile8.actionButtonText = @"Ye went north, 1,2.";
    
        // tile 8 health effect
        tile8.healthEffect = 0;
    
    // build column 3
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile6];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    
    // Tile 3,0
    YSDTile *tile9 = [[YSDTile alloc] init];
    tile9.story = @"This is the tile 9 story";
    tile9.backgroundImage = [UIImage imageNamed:@"YeScurveyDogs-9.png"];
    tile9.visitedBackgroundImage = [UIImage imageNamed:@"tileNoFog.png"];
    tile9.actionButtonText = @"Ye went north, 1,2.";
    
        // tile 9 health effect
        tile9.healthEffect = 0;
    
    // Tile 3,1
    YSDTile *tile10 = [[YSDTile alloc] init];
    tile10.story = @"The Pirate Boss steps from the shadows, and vengance is in yer grasp. Kill or be killed!";
    tile10.backgroundImage = [UIImage imageNamed:@"YeScurveyDogs-10.png"];
    tile10.visitedBackgroundImage = [UIImage imageNamed:@"tileNoFog.png"];
    tile10.actionButtonText = @"Fight!";
    tile10.visitedActionButtonText = @"Fight!";
    
        // tile health effect
        tile10.healthEffect = -5;
    
        // boss tile designation
        tile10.isBossTile = YES;
    
    // Tile 3,2
    YSDTile *tile11 = [[YSDTile alloc] init];
    tile11.story = @"This is the tile 11 story";
    tile11.backgroundImage = [UIImage imageNamed:@"YeScurveyDogs-11.png"];
    tile11.visitedBackgroundImage = [UIImage imageNamed:@"tileNoFog.png"];
    tile11.actionButtonText = @"Ye went north, 1,2.";
    
        // tile 11 health effect
        tile11.healthEffect = 0;
    
    // build column 4
    NSMutableArray *fourthColumn = [[NSMutableArray alloc] init];
    [fourthColumn addObject:tile9];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];

    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;
    
}

-(YSDcharacter *)character1 {
    YSDcharacter *character1 = [[YSDcharacter alloc] init];
    
    character1.characterName = @"Captain Jerry";
    
    character1.health = 10;
    character1.damage = 10;
    character1.characterImageDefault = [UIImage imageNamed:@"character1ImageDefault.png"];
    
    YSDArmor *armor = [[YSDArmor alloc] init];
    armor.armorName = @"Cloak";
    armor.armorValue = 0;
    character1.armor = armor;
    
    YSDWeapon *weapon = [[YSDWeapon alloc] init];
    weapon.weaponName = @"Fists";
    weapon.weaponDamage = 0;
    character1.weapon = weapon;
    
    return character1;
}

-(YSDcharacter *)character2 {
    YSDcharacter *character2 = [[YSDcharacter alloc] init];
    
    character2.characterName = @"Filthy Pierre";
    
    character2.health = 5;
    character2.damage = 15;
    character2.characterImageDefault = [UIImage imageNamed:@"character2ImageDefault.png"];
    
    YSDArmor *armor = [[YSDArmor alloc] init];
    armor.armorName = @"Tattered cloak";
    armor.armorValue = 0;
    character2.armor = armor;
    
    YSDWeapon *weapon = [[YSDWeapon alloc] init];
    weapon.weaponName = @"Dirty fists";
    weapon.weaponDamage = 0;
    character2.weapon = weapon;
    
    return character2;
}

-(YSDcharacter *)character3 {
    YSDcharacter *character3 = [[YSDcharacter alloc] init];
    
    character3.characterName = @"One Eyed Randy";
    
    character3.health = 15;
    character3.damage = 5;
    character3.characterImageDefault = [UIImage imageNamed:@"character3ImageDefault.png"];
    
    YSDArmor *armor = [[YSDArmor alloc] init];
    armor.armorName = @"Robust cloak";
    armor.armorValue = 0;
    character3.armor = armor;
    
    YSDWeapon *weapon = [[YSDWeapon alloc] init];
    weapon.weaponName = @"Limp wrists";
    weapon.weaponDamage = 0;
    character3.weapon = weapon;
    
    return character3;
}

-(YSDBoss *)boss {
    YSDBoss *boss = [[YSDBoss alloc] init];
    boss.bossHealth = 50;
    
    return boss;
}

@end
