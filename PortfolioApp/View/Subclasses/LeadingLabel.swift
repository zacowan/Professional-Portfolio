//
//  LeadingLabel.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 10/31/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class LeadingLabel: UILabel {

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
        self.font = Fonts.cardLeading
        self.textColor = Colors.FontColors.leading
        self.textAlignment = .left
        self.numberOfLines = 2
        self.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
    }
    
}
