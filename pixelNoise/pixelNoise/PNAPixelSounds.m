//
//  PNAPixelSounds.m
//  pixelNoise
//
//  Created by JOHN YAM on 5/5/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "PNAPixelSounds.h"

@implementation PNAPixelSounds

-(void)playSoundWithName:(NSString *)soundName
{
    NSString * file = [[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"];
    
    NSData *fileData = [NSData dataWithContentsOfFile: file];
    
    self.player = [[AVAudioPlayer alloc] initWithData:fileData error:nil];
    
    self.player.numberOfLoops = 0;
    
    [self.player play];
    
    //cant use a pointer, when the scope it over it dies
    //by using a player strong property it stays alive as long as the PixelSounds class exist
                     
}

@end
