//
//  WAMPlaylistListTableViewController.m
//  PlaylistC
//
//  Created by Will morris on 5/20/19.
//  Copyright © 2019 devmtn. All rights reserved.
//

#import "WAMPlaylistListTableViewController.h"
#import "WAMPlaylistController.h"
#import "WAMDetailTableViewController.h"

@interface WAMPlaylistListTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation WAMPlaylistListTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (IBAction)addButtonTapped:(UIBarButtonItem *)sender {
    [[WAMPlaylistController shared] createPlaylistWithName:self.nameTextField.text];
    
    [self.tableView reloadData];
    self.nameTextField.text = @"";
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[WAMPlaylistController shared] playlists] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    
    WAMPlaylist *playlist = [[[WAMPlaylistController shared] playlists] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [playlist name];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu songs", playlist.songs.count];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        WAMPlaylist *playlist = [[[WAMPlaylistController shared] playlists] objectAtIndex:indexPath.row];
        [[WAMPlaylistController shared] deletePlaylist:playlist];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"editPlaylistSegue"]) {
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        WAMDetailTableViewController *destinationVC  = [segue destinationViewController];
        WAMPlaylist *playlist = [[[WAMPlaylistController shared] playlists] objectAtIndex:indexPath.row];
        destinationVC.playlist = playlist;
    }
}

@end
