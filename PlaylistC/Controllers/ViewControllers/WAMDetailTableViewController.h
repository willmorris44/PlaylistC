//
//  WAMDetailTableViewController.h
//  PlaylistC
//
//  Created by Will morris on 5/20/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WAMPlaylistController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WAMDetailTableViewController : UITableViewController

@property (nonatomic, strong) WAMPlaylist *playlist;

@end

NS_ASSUME_NONNULL_END
