//
//  EntryCard.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 12/11/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class EntryCard: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    init(withCaption caption: String, withImageURL url: String) {
        super.init(frame: CGRect())
        self.caption.text = caption
        
        self.addSubview(self.imageView)
        self.addSubview(self.caption)
    }
    
    func applyConstraints() {
        imageViewConstraints()
        captionConstraints()
    }
    
    let imageView: UIImageView = {
        let img = EntryImage(isPng: true)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private func imageViewConstraints() {
        (imageView as! EntryImage).applyWidthConstraints(withView: self)
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
    }
    
    let caption: UILabel = {
        let label = UILabel()
        label.font = Fonts.cardEntryCaption
        label.textColor = Colors.FontColors.caption
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func captionConstraints() {
        caption.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        caption.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        caption.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        caption.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
