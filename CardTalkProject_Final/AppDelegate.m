//
//  AppDelegate.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 27..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "AppDelegate.h"
#import "KHRealmCardModel.h"
#import <Realm/Realm.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    NSData *cookiesData = [[NSUserDefaults standardUserDefaults] objectForKey:@"Cookies"];
    if ([cookiesData length]) {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesData];
        for (NSHTTPCookie *cookie in cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        }
    }

    [self settingMigration];
    
    return YES;
}



- (void)settingMigration {
    [RLMRealm setSchemaVersion:1 forRealmAtPath:[RLMRealm defaultRealmPath]
            withMigrationBlock:^(RLMMigration *migration,
                                 uint64_t oldSchemaVersion) {
                
                [migration enumerateObjects:@"KHRealmCardModel" block:^(RLMObject *oldObject, RLMObject *newObject) {
                    if (oldSchemaVersion < 1) {
                        newObject[@"content"] = @"";
                        newObject[@"createtime"] = @"";
                        newObject[@"title"] = @"";
                        newObject[@"articleID"] = @"";
                        newObject[@"partynumber"] = 0;
                        newObject[@"status"] = 0;
                        newObject[@"author"] =[[KHUserModel alloc] init];
                        newObject[@"date"] = [NSDate date];
                        newObject[@"imageData"] = [[NSData alloc] init];
                    }
                }];
            }];
    
    [RLMRealm setSchemaVersion:1 forRealmAtPath:[RLMRealm defaultRealmPath] withMigrationBlock:^(RLMMigration *migration, uint64_t oldSchemaVersion) {
        [migration enumerateObjects:@"KHChatMode" block:^(RLMObject *oldObject, RLMObject *newObject) {
            if (oldSchemaVersion < 1) {
                newObject[@"user"] = [[KHUserModel alloc] init];
                newObject[@"content"] = @"";
                newObject[@"time"] = @"";
                newObject[@"articleid"] = @"";
                newObject[@"date"] = [NSDate date];
            }
        }];
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    
    
    NSData *cookieData = [NSKeyedArchiver archivedDataWithRootObject:cookies];
    [[NSUserDefaults standardUserDefaults] setObject:cookieData forKey:@"Cookies"];
}

@end
