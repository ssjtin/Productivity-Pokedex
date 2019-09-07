//
//  AppDelegate.swift
//  Productivity Pokedex
//
//  Created by Hoang Luong on 1/9/19.
//  Copyright © 2019 Hoang Luong. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        
//        let pokedexData = PokedexData.shared
//        let nav = UINavigationController(rootViewController: BattleVC(pokemon: pokedexData.pokemon[0]))
//        window?.rootViewController = nav
        
        let tabBar = UITabBarController()
        
        let mapsVC = MapsVC()
        let pokedexVC = PokedexVC()
        let programsVC = ProgramsVC()
        
        tabBar.viewControllers = [mapsVC, pokedexVC, programsVC]
        tabBar.selectedViewController = mapsVC
        
        let item = UITabBarItem()
        item.title = "Maps"
        item.image = UIImage(named: "map-icon")
        
        let pokedexItem = UITabBarItem()
        pokedexItem.title = "Pokedex"
        pokedexItem.image = UIImage(named: "pokedex-icon")
        
        let programsItem = UITabBarItem()
        programsItem.title = "Programs"
        programsItem.image = UIImage(named: "programs-icon")
        
        mapsVC.tabBarItem = item
        pokedexVC.tabBarItem = pokedexItem
        programsVC.tabBarItem = programsItem
        
        window?.rootViewController = tabBar
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}

}

