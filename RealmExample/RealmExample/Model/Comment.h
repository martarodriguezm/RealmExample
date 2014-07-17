//
//  Comment.h
//  RealmExample
//
//  Created by Marta Rodriguez Martin on 17/07/14.
//  Copyright (c) 2014 Intelygenz. All rights reserved.
//

#import <Realm/Realm.h>
//#import "Post.h"

@interface Comment : RLMObject
// Add properties here to define the model
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSDate *date;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Comment>
RLM_ARRAY_TYPE(Comment)
