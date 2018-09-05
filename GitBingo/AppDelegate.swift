//
//  AppDelegate.swift
//  Gitergy
//
//  Created by 이동건 on 23/08/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        center.requestAuthorization(options: options) {
            (granted, error) in
            
        }
        
        addShortcuts(to: application)
        
        return true
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        if shortcutItem.type == "SetAlarm" {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initViewController  = storyBoard.instantiateViewController(withIdentifier: "MainNavigationController")
            let registerAlertViewController = storyBoard.instantiateViewController(withIdentifier: RegisterAlertViewController.reusableIdentifier)
            
            self.window?.rootViewController = initViewController
            self.window?.makeKeyAndVisible()
            
            initViewController.present(registerAlertViewController, animated: true, completion: nil)
        }
    }
    
    private func addShortcuts(to application: UIApplication) {
        let alarmShortcut = UIMutableApplicationShortcutItem(type: "SetAlarm", localizedTitle: "Set Alarm".localized, localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .alarm), userInfo: nil)
        
        application.shortcutItems = [alarmShortcut]
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }
}

