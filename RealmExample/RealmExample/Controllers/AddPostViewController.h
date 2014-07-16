//
//  AddPostViewController.h
//  RealmExample
//
//  Created by Marta Rodriguez Martin on 16/07/14.
//  Copyright (c) 2014 Intelygenz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPostViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *postTitle;
@property (nonatomic, weak) IBOutlet UITextView *postText;

- (IBAction)saveButtonTapped:(id)sender;

@end
