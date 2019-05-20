//
//  WAMPlaylistController.m
//  PlaylistC
//
//  Created by Will morris on 5/20/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import "WAMPlaylistController.h"

@interface WAMPlaylistController()

@property (nonatomic, strong, readwrite) NSMutableArray* internalPlaylists;

@end

@implementation WAMPlaylistController

+ (WAMPlaylistController*)shared {
    static WAMPlaylistController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [WAMPlaylistController new];
    });
    return shared;
}

- (instancetype) init {
    self = [super init];
    if (self) {
        _internalPlaylists = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)playlists {
    return self.internalPlaylists;
}

- (void)createPlaylistWithName:(NSString *)name {
    WAMPlaylist *newPlaylist = [[WAMPlaylist alloc] initWithName:name songs:[NSMutableArray new]];
    [self.internalPlaylists addObject:newPlaylist];
}

- (void)deletePlaylist:(WAMPlaylist *)playlist {
    [self.internalPlaylists removeObject:playlist];
}

- (void)addSongWithtitle:(NSString *)title andArtist:(NSString *)artist toPlaylist:(WAMPlaylist *)playlist {
    WAMSong *newSong = [[WAMSong alloc] initWithTitle:title artist:artist];
    [playlist addSongsObject:newSong];
}

- (void)removeSong:(WAMSong *)song fromPlaylist:(WAMPlaylist *)playlist {
    [playlist removeSongsObject:song];
}

@end
