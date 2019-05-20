//
//  WAMPlaylist.m
//  PlaylistC
//
//  Created by Will morris on 5/20/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import "WAMPlaylist.h"

@interface WAMPlaylist()

@property (nonatomic, strong) NSMutableArray* internalSongs;

@end

@implementation WAMPlaylist

- (instancetype) initWithName:(NSString *)name songs:(NSArray *)songs {
    
    self = [super init];
    if (self) {
        _name = name;
        _internalSongs = [songs mutableCopy];
    }
    return self;
}

// Mark: - Methods
- (void) addSongsObject:(WAMSong *)object {
    [self.internalSongs addObject:object];
}

- (void) removeSongsObject:(WAMSong *)object {
    [self.internalSongs removeObject:object];
}

- (NSArray *)songs {
    return self.internalSongs;
    
}

@end
