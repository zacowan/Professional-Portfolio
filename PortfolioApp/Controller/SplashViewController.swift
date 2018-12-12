//
//  ViewController.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 10/31/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = Colors.background
        
        // Add the UI
        let splashView = SplashView(withView: view)
        let viewElements = splashView.getElements()
        for element in viewElements {
            view.addSubview(element)
        }
        splashView.addConstraints()
        
        // Do stuff
        let button = splashView.getButton()
        button.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc private func closeView() {
        let vc = NavigationViewController.shared
        present(vc, animated: false, completion: nil)
    }


}

