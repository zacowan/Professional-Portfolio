//
//  ExitButton.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/23/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class ExitButton: UIButton {

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
        let buttonSize: CGFloat = 40
        self.backgroundColor = UIColor.gray
        self.layer.opacity = 0.5
        self.setTitleColor(Colors.FontColors.button, for: .normal)
        self.setTitle("X", for: .normal)
        self.layer.cornerRadius = buttonSize / 2
        self.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        self.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
    }

}
