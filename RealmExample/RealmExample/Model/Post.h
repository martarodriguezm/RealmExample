//
//  Post.h
//  RealmExample
//
//  Created by Marta Rodriguez Martin on 16/07/14.
//  Copyright (c) 2014 Intelygenz. All rights reserved.
//

#import <Realm/Realm.h>

@interface Post : RLMObject
// Add properties here to define the model
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *publishDate;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Post>
RLM_ARRAY_TYPE(Post)
