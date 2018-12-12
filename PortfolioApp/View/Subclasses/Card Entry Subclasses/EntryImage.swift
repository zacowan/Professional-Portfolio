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
    
    var imageHeight: CGFloat = 100
    var imageURL: String?
    
    private let DISTANCE_FROM_TOP_AND_BOTTOM: CGFloat = 40
    private let DISTANCE_FROM_SIDES: CGFloat = 20
    private let DISTANCE_BETWEEN: CGFloat = 40
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Colors.cardEntryCardBackground
        
        self.addSubview(self.imageView)
        self.addSubview(self.caption)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func finishSetup() {
        imageViewConstraints()
        captionConstraints()
        self.bottomAnchor.constraint(equalTo: caption.bottomAnchor, constant: DISTANCE_FROM_TOP_AND_BOTTOM).isActive = true
        
        imageView.imageFromServerURL(imageURL!, placeHolder: UIImage())
    }
    
    private let imageView: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private func imageViewConstraints() {
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: DISTANCE_FROM_TOP_AND_BOTTOM).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
    }
    
    private let caption: UILabel = {
        let label = UILabel()
        label.font = Fonts.cardEntryCaption
        label.textColor = Colors.FontColors.caption
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private func captionConstraints() {
        caption.leftAnchor.constraint(equalTo: self.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        caption.rightAnchor.constraint(equalTo: self.rightAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        caption.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: DISTANCE_BETWEEN).isActive = true
    }
    
    func setImageHeight(withNum num: Int) {
        self.imageHeight = CGFloat(num)
    }
    
    func setImageURL(withURL url: String) {
        self.imageURL = url
    }
    
    func setCaption(withText txt: String) {
        self.caption.text = txt
    }
    
}
