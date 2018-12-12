//
//  CardEntryViewController.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/2/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class CardEntryViewController: UIViewController {
    
    private var data: CardData?
    private var splashImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = Colors.cardEntryBackground
        
        // Add the UI
        let cardEntryView = CardEntryView(withView: view)
        let viewElements = cardEntryView.getElements()
        for element in viewElements {
            view.addSubview(element)
        }
        cardEntryView.addConstraints()
        cardEntryView.setData(wtihData: data!, withSplashImage: splashImage!)
        cardEntryView.getExitButton().addTarget(self, action: #selector(exitViewController), for: .touchUpInside)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @objc private func exitViewController() {
        NavigationViewController.shared.popViewController(animated: true)
    }
    
    init(withData data: CardData, withSplashImage splashImage: UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.data = data
        self.splashImage = splashImage
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
