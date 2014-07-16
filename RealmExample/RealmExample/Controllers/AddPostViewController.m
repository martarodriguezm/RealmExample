//
//  AddPostViewController.m
//  RealmExample
//
//  Created by Marta Rodriguez Martin on 16/07/14.
//  Copyright (c) 2014 Intelygenz. All rights reserved.
//

#import "AddPostViewController.h"
#import "Post.h"

@interface AddPostViewController ()

@end

@implementation AddPostViewController

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
    
    self.postText.userInteractionEnabled = YES;
    self.postText.editable = YES;
    // Do any additional setup after loading the view.
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
#pragma mark - actions
/********************************************************/
- (IBAction)saveButtonTapped:(id)sender {
    Post *post = [[Post alloc] init];
    post.title = self.postTitle.text;
    post.text = self.postText.text;
    post.publishDate = [NSDate date];
    
    // Get the default Realm
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    // Add to Realm with transaction
    [realm beginWriteTransaction];
    [realm addObject:post];
    [realm commitWriteTransaction];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
