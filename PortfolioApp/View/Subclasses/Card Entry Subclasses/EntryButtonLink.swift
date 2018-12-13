//
//  EntryButtonLink.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 12/11/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class EntryButtonLink: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var href: String?
    private let BUTTON_HEIGHT: CGFloat = 70
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.titleLabel?.textAlignment = .left
        self.backgroundColor = Colors.cardEntryCardBackground
        self.setTitleColor(Colors.highlight, for: .normal)
        self.layer.cornerRadius = ConstantNumbers.defaultCornerRadius / 2
    }
    
    func finishSetup() {
        self.heightAnchor.constraint(equalToConstant: BUTTON_HEIGHT).isActive = true
        self.titleLabel?.font = Fonts.cardEntryButtonLink
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(withTxt txt: String) {
        self.setTitle(txt, for: .normal)
    }
    
    func setHref(withURL url: String) {
        self.href = url
    }
    
    func getComputedHeight() -> CGFloat {
        return BUTTON_HEIGHT
    }

}
