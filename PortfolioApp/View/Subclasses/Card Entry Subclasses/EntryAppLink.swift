//
//  EntryAppLink.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 12/11/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class EntryAppLink: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var computedHeight: CGFloat = 0
    var href: String?
    var imageURL: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Colors.cardEntryCardBackground
        
        self.addSubview(self.imageView)
        self.addSubview(self.title)
        self.addSubview(self.caption)
        
        computedHeight = 250 + self.title.intrinsicContentSize.height + self.caption.intrinsicContentSize.height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyConstraints() {
        self.heightAnchor.constraint(equalToConstant: computedHeight).isActive = true
        imageViewConstraints()
        titleConstraints()
        captionConstraints()
    }
    
    private let imageView: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = ConstantNumbers.defaultCornerRadius * 2
        img.backgroundColor = Colors.cardEntryBackground
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private func imageViewConstraints() {
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = Fonts.cardEntryTitle
        label.textColor = Colors.highlight
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private func titleConstraints() {
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
    }
    
    private let caption: UILabel = {
        let label = UILabel()
        label.font = Fonts.cardEntrySubtitle
        label.textColor = Colors.FontColors.subtitle
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private func captionConstraints() {
        caption.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        caption.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
    }
    
    func setCaption(withText txt: String) {
        self.caption.text = txt
    }
    
    func setTitle(withText txt: String) {
        self.title.text = txt
    }
    
    func setImageURL(withImageURL url: String) {
        self.imageURL = url
    }
    
    func setHref(withURL url: String) {
        self.href = url
    }

}
