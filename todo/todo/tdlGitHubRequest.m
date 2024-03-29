//
//  tdlGitHubRequest.m
//  todo
//
//  Created by JOHN YAM on 4/7/14.
//  Copyright (c) 2014 John Yam. All rights reserved.
//

#import "tdlGitHubRequest.h"

@implementation tdlGitHubRequest

+ (NSDictionary *)getUserWithUsername:(NSString *)username
{
    NSMutableDictionary * userInfo = [@{} mutableCopy];
    
    NSString * github = [NSString stringWithFormat:@"https://api.github.com/users/%@",username];
    NSURL *url = [NSURL URLWithString:github];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
//    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        if (connectionError == nil)
//        {
//            
//        } else {
//            NSLog(@"%@", connectionError);
//        }
//    }];
    
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
 
    NSError * jsonError = nil;
    
    NSDictionary *githubProfile = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&jsonError];
    
//    for (NSString * key in [githubProfile allKeys]){
//        
//    }
    
    NSLog(@"%@",githubProfile);
    
    if(githubProfile[@"name"] != nil) [userInfo setObject:githubProfile[@"name"] forKey:@"name"];
    //literal version below
    //if(githubProfile[@"name"] != nil) [userInfo[@"name"] = githubProfile[@"name"];
    if(githubProfile[@"avatar_url"] != nil) [userInfo setObject:githubProfile[@"avatar_url"] forKey:@"image"];
    if(githubProfile[@"html_url"] != nil) [userInfo setObject:githubProfile[@"html_url"] forKey:@"github"];
    

//    userInfo = @{@"name": githubProfile[@"name"],
//                 @"image": githubProfile[@"avatar_url"],
//                 @"github": githubProfile[@"html_url"]
//                 };
    
  
    return userInfo;

}


@end
