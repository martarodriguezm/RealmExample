//
//  PostViewController.m
//  RealmExample
//
//  Created by Marta Rodriguez Martin on 17/07/14.
//  Copyright (c) 2014 Intelygenz. All rights reserved.
//

#import "PostViewController.h"
#import "Comment.h"

@interface PostViewController ()

@end

@implementation PostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.postTitle setText:self.post.title];
    [self.postText setText:self.post.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/********************************************************/
#pragma mark - TableViewDataSource
/********************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.post.comments count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CommentCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    Comment *comment = [self.post.comments objectAtIndex:indexPath.row];
    cell.textLabel.text = comment.comment;
    cell.detailTextLabel.text = [comment.date description];
    
    return cell;
    
}

/********************************************************/
#pragma mark - actions
/********************************************************/
- (IBAction)addCommentTapped:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"New Comment" message:@"Write your comment" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Accept", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1) {
        NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
        Comment *comment = [[Comment alloc] init];
        comment.comment = [[alertView textFieldAtIndex:0] text];
        comment.date = [NSDate date];
        
        // Get the default Realm
        RLMRealm *realm = [RLMRealm defaultRealm];
        
        // Add to Realm with transaction
        [realm beginWriteTransaction];
        [self.post.comments addObject:comment];
        [realm addObject:self.post];
        [realm commitWriteTransaction];
        
        [self.commentsTableView reloadData];
    }
}

@end
