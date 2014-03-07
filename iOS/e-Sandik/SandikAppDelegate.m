//
//  SandikAppDelegate.m
//  e-Sandik
//
//  Created by Alperen Kavun on 08.11.2012.
//  Copyright (c) 2012 Halıcı. All rights reserved.
//

#import "SandikAppDelegate.h"

@implementation SandikAppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
//    sleep(3);
    
    if([[UIScreen mainScreen] bounds].size.height == 568){
        _window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mainbg-568h.png"]];
    }
    else{
        _window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mainbg.png"]];
    }
    
    NSString* string = [[NSUserDefaults standardUserDefaults] objectForKey:@"isUpdateMade"];
    
    if (string == nil || [string isEqualToString:@"NO"]) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Bilgilendirme" message:@"Yüksek Seçim Kurulu’nun verdiği karar uyarınca uygulama parti görevlileri dışında kullanıma kapatılmıştır!" delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil];
        [alertView show];
        
        alertView.delegate = self;
        
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"isUpdateMade"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return YES;
}

//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (buttonIndex != alertView.cancelButtonIndex){
//        // open app store
//        NSString* url = @"itms-apps://itunes.apple.com/app/e-secmen/id670241191";
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
//        
//    } else {
//    }
//}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
