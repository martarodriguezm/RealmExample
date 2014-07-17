//
//  ViewController.m
//  RealmExample
//
//  Created by Marta Rodriguez Martin on 16/07/14.
//  Copyright (c) 2014 Intelygenz. All rights reserved.
//

#import "ViewController.h"
#import "Post.h"
#import "PostViewController.h"

@interface ViewController () {
    int _selectedRow;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.destinationViewController isKindOfClass:[PostViewController class]]) {
        PostViewController* postViewController = (PostViewController*) segue.destinationViewController;
        postViewController.post = [[Post allObjects] objectAtIndex:_selectedRow];
    }
}

/********************************************************/
#pragma mark - TableViewDataSource
/********************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[Post allObjects] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"PostCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    // Configure the cell...
    Post *post = [[Post allObjects] objectAtIndex:indexPath.row];
    NSLog(@"post title = %@", post.title);
    cell.textLabel.text = post.title;
    cell.detailTextLabel.text = [post.publishDate description];
    
    return cell;
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
         Post *post = [[Post allObjects] objectAtIndex:indexPath.row];
        
        // Get the default Realm
        RLMRealm *realm = [RLMRealm defaultRealm];
        
        // Add to Realm with transaction
        [realm beginWriteTransaction];
        [realm deleteObject:post];
        [realm commitWriteTransaction];
        [tableView reloadData]; // tell table to refresh now
    }
}

/********************************************************/
#pragma mark - TableViewDelegate
/********************************************************/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _selectedRow = indexPath.row;
    [self performSegueWithIdentifier:@"SeePostSegue" sender:self];
    
}
@end
