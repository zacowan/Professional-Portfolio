//
//  Card.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/1/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class Card: UICollectionViewCell {
    
    private var data: CardData?
    private var parentViewController: UIViewController?
    
    private let DISTANCE_FROM_SIDES: CGFloat = 15
    private let DISTANCE_BETWEEN_CARDS: CGFloat = 15
    
    override init(frame: CGRect) {
        super.init(frame: CGRect())
        applyCardStyling()
        container.addTarget(self, action: #selector(didTapCard), for: .touchUpInside)
    }
    
    @objc private func didTapCard() {
        TabBarController.currentTabIndex = TabBarController.subtitleIndexes[(parentViewController as! CardCollectionViewController).getSubtitle()!]!
        let newVC = CardEntryViewController(withData: data!)
        parentViewController?.present(newVC, animated: false, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyCardStyling() {
        containerSetup()
        imageViewSetup()
        headingContainerSetup()
    }
    
    // UI Setup
    
    private let container = UIButton()
    
    private func containerSetup() {
        self.addSubview(container)
        
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.clipsToBounds = true
        container.backgroundColor = Colors.cardBackground
        container.layer.cornerRadius = 25
        
        container.leftAnchor.constraint(equalTo: self.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        container.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        container.topAnchor.constraint(equalTo: self.topAnchor, constant: DISTANCE_BETWEEN_CARDS).isActive = true
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -DISTANCE_BETWEEN_CARDS).isActive = true
    }
    
    private let imageView = UIImageView()
    
    // TODO: Add a UIView after the backImageView to round the corners at the top
    private func imageViewSetup() {
        container.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //imageView.backgroundColor = Colors.highlight
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -100).isActive = true
    }
    
    private let headingContainer = UIView()
    
    private func headingContainerSetup() {
        container.addSubview(headingContainer)
        headingContainer.isUserInteractionEnabled = false
        
        headingContainer.translatesAutoresizingMaskIntoConstraints = false
        
        headingContainer.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        headingContainer.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        headingContainer.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        headingContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        titleSetup()
        subtitleSetup()
        leadingSetup()
    }
    
    private let title = TitleLabel()
    
    private func titleSetup() {
        headingContainer.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.leftAnchor.constraint(equalTo: headingContainer.leftAnchor, constant: 20).isActive = true
        title.rightAnchor.constraint(equalTo: headingContainer.rightAnchor, constant: -20).isActive = true
        title.centerYAnchor.constraint(equalTo: headingContainer.centerYAnchor).isActive = true
    }
    
    private let subtitle = SubtitleLabel()
    
    private func subtitleSetup() {
        headingContainer.addSubview(subtitle)
        
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        subtitle.leftAnchor.constraint(equalTo: headingContainer.leftAnchor, constant: 20).isActive = true
        subtitle.rightAnchor.constraint(equalTo: headingContainer.rightAnchor, constant: -20).isActive = true
        subtitle.bottomAnchor.constraint(equalTo: title.topAnchor).isActive = true
    }
    
    public let leading = LeadingLabel()
    
    private func leadingSetup() {
        headingContainer.addSubview(leading)
        
        leading.translatesAutoresizingMaskIntoConstraints = false
        
        leading.leftAnchor.constraint(equalTo: headingContainer.leftAnchor, constant: 20).isActive = true
        leading.rightAnchor.constraint(equalTo: headingContainer.rightAnchor, constant: -20).isActive = true
        leading.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
    }
    
    public func setParentViewController(withViewController vc: UIViewController) {
        parentViewController = vc
    }
    
    public func setData(withData d: CardData) {
        data = d
        title.text = data?.getTitle()
        subtitle.text = data?.getSubtitle()
        leading.text = data?.getLeading()
        // Add something for setting the image
    }
    
}
