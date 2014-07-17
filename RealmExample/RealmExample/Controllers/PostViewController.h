//
//  PostViewController.h
//  RealmExample
//
//  Created by Marta Rodriguez Martin on 17/07/14.
//  Copyright (c) 2014 Intelygenz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, strong) Post *post;

@property (nonatomic, weak) IBOutlet UILabel* postTitle;
@property (nonatomic, weak) IBOutlet UILabel* postText;
@property (nonatomic, weak) IBOutlet UITableView *commentsTableView;

@end
