//
//  TabBarController.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/1/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    private static let subtitles = ["Home", "Code", "Design"]
    public static let subtitleIndexes = ["Home" : 0, "Code" : 1, "Design" : 2]
    
    private let homeViewController = CardCollectionViewController(withSubtitle: TabBarController.subtitles[0])
    private let codeViewController = CardCollectionViewController(withSubtitle: TabBarController.subtitles[1])
    private let designViewController = CardCollectionViewController(withSubtitle: TabBarController.subtitles[2])
    
    public static var currentTabIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        homeViewController.tabBarItem = UITabBarItem(title: TabBarController.subtitles[0], image: UIImage(named: TabBarController.subtitles[0]), tag: 0)
        codeViewController.tabBarItem = UITabBarItem(title: TabBarController.subtitles[1], image: UIImage(named: TabBarController.subtitles[1]), tag: 1)
        designViewController.tabBarItem = UITabBarItem(title: TabBarController.subtitles[2], image: UIImage(named: TabBarController.subtitles[2]), tag: 2)
        
        tabBar.tintColor = Colors.highlight
        
        viewControllers = [homeViewController, codeViewController, designViewController]
    }

}
