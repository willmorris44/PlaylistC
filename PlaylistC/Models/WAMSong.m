//
//  WAMSong.m
//  PlaylistC
//
//  Created by Will morris on 5/20/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import "WAMSong.h"

@implementation WAMSong

- (instancetype) initWithTitle:(NSString *)title artist:(NSString *)artist {
    
    self = [super init];
    if (self) {
        _title = title;
        _artist = artist;
    }
    return self;
}

@end
