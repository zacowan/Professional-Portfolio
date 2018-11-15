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
        cardEntryView.setData(wtihData: data!)
    }
    
    init(withData data: CardData) {
        super.init(nibName: nil, bundle: nil)
        self.data = data
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
