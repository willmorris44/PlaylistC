//
//  WAMPlaylist.h
//  PlaylistC
//
//  Created by Will morris on 5/20/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WAMSong;

NS_ASSUME_NONNULL_BEGIN

@interface WAMPlaylist : NSObject

@property (nonatomic, copy) NSString* name;
@property (nonatomic, strong, readonly) NSArray* songs;

- (instancetype) initWithName:(NSString*)name songs:(NSArray*)songs;

- (void) addSongsObject:(WAMSong *)object;
- (void) removeSongsObject:(WAMSong *)object;

@end

NS_ASSUME_NONNULL_END
