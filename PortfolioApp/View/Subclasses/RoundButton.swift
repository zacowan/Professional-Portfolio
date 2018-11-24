//
//  RoundButton.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 10/31/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyling()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyling() {
        self.backgroundColor = Colors.highlight
        self.setTitleColor(Colors.FontColors.button, for: .normal)
        self.setTitle("Button", for: .normal)
        self.layer.cornerRadius = 30
        self.heightAnchor.constraint(equalToConstant: 60).isActive = true
        self.frame.size.width = 200
    }
    
}
