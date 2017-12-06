//
//  AppDelegate.swift
//  Challenge
//
//  Created by Emre Berk on 05/12/2017.
//  Copyright © 2017 Emre Berk. All rights reserved.
//

import UIKit
import ChameleonFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UIApplication.shared.statusBarStyle = .lightContent
        
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = .flatBlack
        appearance.tintColor = .white
        appearance.isTranslucent = false
        appearance.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white,
                                          NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Medium", size: 18)!]
        
        return true
    }


}

