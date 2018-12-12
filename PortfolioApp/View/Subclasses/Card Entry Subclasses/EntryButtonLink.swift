//
//  EntryButtonLink.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 12/11/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class EntryButtonLink: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var href: String?
    private let buttonHeight: CGFloat = 150
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Colors.cardEntryCardBackground
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(withTxt txt: String) {
        
    }
    
    func setHref(withURL url: String) {
        self.href = url
    }
    
    func getHeight() -> CGFloat {
        return self.buttonHeight
    }

}
