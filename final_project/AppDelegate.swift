//
//  AppDelegate.swift
//  final_project
//
//  Created by Thomas Silva on 2015-12-09.
//  Copyright © 2015 Thomas Silva. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //Parse.setApplicationId("LPhfzfjiHR30GbYyt5RP2aWgxOYwYjPmFCwlBsAS", clientKey:"uDQnSEgGROSaez366Sk4DQlC0AlCc4Jg3z10OeQy")
        //Parse.setApplicationId("dZAfQ7v9o7rkWn8dXFJZUqE2AJCVCtJ4xa9jP9OA", clientKey:"qMeO2AQc2SHgiyn8DgNBB3oVGn2XSnWuZS1C6jR9")
        Parse.setApplicationId("9cTEPhALPtIZG62RxjiQYFZfE9hp0EQZ2C8bALlP", clientKey: "FXs8qkbRUWQm0xfK57LYFWPJTzsLjeNiU0dbozOB")

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

