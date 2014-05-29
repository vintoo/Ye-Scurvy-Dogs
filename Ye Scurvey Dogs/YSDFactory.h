//
//  YSDFactory.h
//  Ye Scurvey Dogs
//
//  Created by Forrest Stewart on 5/10/14.
//  Copyright (c) 2014 8bitpirates. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSDcharacter.h"
#import "YSDBoss.h"

@interface YSDFactory : NSObject

-(NSArray *)tiles;
-(YSDcharacter *)character1;
-(YSDcharacter *)character2;
-(YSDcharacter *)character3;
-(YSDBoss *)boss;

@end
