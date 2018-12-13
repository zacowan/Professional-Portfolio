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
    
    private let DISTANCE_FROM_SIDES: CGFloat = 20
    private let DISTANCE_BETWEEN: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.imageView)
        self.addSubview(self.captionContainer)
        captionContainer.addSubview(self.caption)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func finishSetup() {
        imageViewConstraints()
        captionContainerConstraints()
        captionConstraints()
        captionContainer.bottomAnchor.constraint(equalTo: caption.bottomAnchor, constant: DISTANCE_BETWEEN).isActive = true
        self.bottomAnchor.constraint(equalTo: captionContainer.bottomAnchor).isActive = true
        
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
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    private let captionContainer: UIView = {
        let container = UIView()
        container.backgroundColor = Colors.cardEntryCardBackground
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private func captionContainerConstraints() {
        captionContainer.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        captionContainer.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        captionContainer.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    private let caption: UILabel = {
        let label = UILabel()
        label.font = Fonts.cardEntryCaption
        label.textColor = Colors.FontColors.caption
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 4
        return label
    }()
    
    private func captionConstraints() {
        caption.leftAnchor.constraint(equalTo: captionContainer.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        caption.rightAnchor.constraint(equalTo: captionContainer.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
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
    
    func getComputedHeight() -> CGFloat {
        return imageHeight + caption.calculateHeightBasedOnText(width: NavigationViewController.shared.view.frame.standardized.width - (DISTANCE_FROM_SIDES * 2)) + (DISTANCE_BETWEEN * 2)
    }
    
}
