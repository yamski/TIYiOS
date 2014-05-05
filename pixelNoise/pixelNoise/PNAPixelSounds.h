//
//  PNAPixelSounds.h
//  pixelNoise
//
//  Created by JOHN YAM on 5/5/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AVFoundation/AVFoundation.h>

@interface PNAPixelSounds : NSObject


@property (nonatomic) AVAudioPlayer * player;

-(void)playSoundWithName:(NSString *)soundName;

@end
