//
//  EntryImage.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 12/11/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class EntryImage: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var computedHeight: CGFloat = 0
    var imageHeight: Int = 100
    var imageURL: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
    
    func applyWidthConstraints(withView view: UIView) {
        self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageHeight(withNum num: Int) {
        self.imageHeight = num
    }
    
    func setImageURL(withURL url: String) {
        self.imageURL = url
    }
    
    func setCaption(withText txt: String) {
        
    }
    
}
