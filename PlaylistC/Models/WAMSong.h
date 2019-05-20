//
//  WAMSong.h
//  PlaylistC
//
//  Created by Will morris on 5/20/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WAMSong : NSObject

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* artist;

- (instancetype) initWithTitle:(NSString *)title artist:(NSString *) artist;

@end

NS_ASSUME_NONNULL_END
