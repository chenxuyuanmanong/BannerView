//
//  AppDelegate.swift
//  BannerView
//
//  Created by kaiya on 2020/11/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = ViewController()
        vc.view.backgroundColor = UIColor.white
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }



}

