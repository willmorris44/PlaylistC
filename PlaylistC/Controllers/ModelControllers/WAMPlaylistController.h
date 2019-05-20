//
//  WAMPlaylistController.h
//  PlaylistC
//
//  Created by Will morris on 5/20/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WAMPlaylist.h"
#import "WAMSong.h"

NS_ASSUME_NONNULL_BEGIN

@interface WAMPlaylistController : NSObject

@property (nonatomic, strong, readonly) NSArray * playlists;

+ (WAMPlaylistController *) shared;

//Create
- (void) createPlaylistWithName:(NSString*)name;

//Delete
- (void) deletePlaylist:(WAMPlaylist*)playlist;

//Add song
- (void) addSongWithtitle:(NSString*)title andArtist:(NSString*)artist toPlaylist:(WAMPlaylist*)playlist;

//Remove Song
- (void) removeSong:(WAMSong*)song fromPlaylist:(WAMPlaylist*)playlist;

@end

NS_ASSUME_NONNULL_END
