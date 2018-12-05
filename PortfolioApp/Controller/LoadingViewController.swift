//
//  LoadingViewController.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 12/3/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private var leading: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = Colors.background
        
        // Add the UI
        let loadView = LoadingView(withView: view)
        let viewElements = loadView.getElements()
        for element in viewElements {
            view.addSubview(element)
        }
        loadView.addConstraints()
        leading = loadView.getLeading()
        
        // Do stuff
        
    }
    
    public func displayErrorMessages(_ message: String) {
        leading!.text = "Error loading data: \(message)."
    }

}
