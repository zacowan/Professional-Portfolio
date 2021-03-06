//
//  EntryAppLink.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 12/11/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class EntryAppLink: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var href: String?
    var imageURL: String?
    
    private let DISTANCE_FROM_TOP_AND_BOTTOM: CGFloat = 40
    private let APP_ICON_SIZE: CGFloat = 150
    private let DISTANCE_BETWEEN: CGFloat = 20
    private let BUTTON_WIDTH: CGFloat = 80
    private let BUTTON_HEIGHT: CGFloat = 40
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = Colors.cardEntryCardBackground
        
        self.addSubview(self.imgView)
        self.addSubview(self.title)
        self.addSubview(self.caption)
        self.addSubview(self.miniButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func finishSetup() {
        imageViewConstraints()
        titleConstraints()
        captionConstraints()
        miniButtonConstraints()
        self.bottomAnchor.constraint(equalTo: miniButton.bottomAnchor, constant: DISTANCE_FROM_TOP_AND_BOTTOM).isActive = true
        self.imgView.imageFromServerURL(imageURL!, placeHolder: UIImage())
    }
    
    private let imgView: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFit
        img.layer.cornerRadius = ConstantNumbers.defaultCornerRadius * 2
        img.backgroundColor = Colors.cardEntryBackground
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private func imageViewConstraints() {
        imgView.topAnchor.constraint(equalTo: self.topAnchor, constant: DISTANCE_FROM_TOP_AND_BOTTOM).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: APP_ICON_SIZE).isActive = true
        imgView.widthAnchor.constraint(equalTo: imgView.heightAnchor).isActive = true
        imgView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
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
        title.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: DISTANCE_BETWEEN).isActive = true
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
    
    private let miniButton: UILabel = {
        let button = UILabel()
        button.textColor = Colors.cardEntryCardBackground
        button.text = "VIEW"
        button.font = Fonts.cardEntryButtonLink
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.highlight
        button.textAlignment = .center
        button.clipsToBounds = true
        return button
    }()
    
    private func miniButtonConstraints() {
        miniButton.layer.cornerRadius = BUTTON_HEIGHT / 2
        miniButton.widthAnchor.constraint(equalToConstant: BUTTON_WIDTH).isActive = true
        miniButton.heightAnchor.constraint(equalToConstant: BUTTON_HEIGHT).isActive = true
        miniButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        miniButton.topAnchor.constraint(equalTo: caption.bottomAnchor, constant: DISTANCE_BETWEEN).isActive = true
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
    
    func getComputedHeight() -> CGFloat {
        return (DISTANCE_FROM_TOP_AND_BOTTOM * 2) + APP_ICON_SIZE + DISTANCE_BETWEEN + title.calculateHeightBasedOnText(width: NavigationViewController.shared.view.frame.standardized.width) + caption.calculateHeightBasedOnText(width: NavigationViewController.shared.view.frame.standardized.width) + BUTTON_HEIGHT
    }

}
