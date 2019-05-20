//
//  WAMDetailTableViewController.m
//  PlaylistC
//
//  Created by Will morris on 5/20/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import "WAMDetailTableViewController.h"
#import "WAMPlaylistController.h"
#import "WAMSong.h"
#import "WAMPlaylist.h"

@interface WAMDetailTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *songTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;

@end

@implementation WAMDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender {
    [[WAMPlaylistController shared] addSongWithtitle:self.songTextField.text andArtist:self.artistTextField.text toPlaylist:self.playlist];
    [self.tableView reloadData];
    self.artistTextField.text = @"";
    self.songTextField.text = @"";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.playlist.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"songCell" forIndexPath:indexPath];
    
    WAMSong *song = self.playlist.songs[indexPath.row];
    
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
