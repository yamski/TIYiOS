//
//  tdlGitHubRequest.h
//  todo
//
//  Created by JOHN YAM on 4/7/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tdlGitHubRequest : NSObject

+ (NSDictionary *)getUserWithUsername: (NSString *)username;

@end
