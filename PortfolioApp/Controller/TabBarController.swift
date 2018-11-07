//
//  TabBarController.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/1/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let homeTitle = "Home"
        let codeTitle = "Code"
        let designTitle = "Design"

        let homeViewController = CardCollectionViewController(withSubtitle: homeTitle)
        homeViewController.tabBarItem = UITabBarItem(title: homeTitle, image: UIImage(named: homeTitle), tag: 0)
        let codeViewController = CardCollectionViewController(withSubtitle: codeTitle)
        codeViewController.tabBarItem = UITabBarItem(title: codeTitle, image: UIImage(named: codeTitle), tag: 1)
        let designViewController = CardCollectionViewController(withSubtitle: designTitle)
        designViewController.tabBarItem = UITabBarItem(title: designTitle, image: UIImage(named: designTitle), tag: 2)
        
        tabBar.tintColor = Colors.highlight
        
        viewControllers = [homeViewController, codeViewController, designViewController]
    }

}
