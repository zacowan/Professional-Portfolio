//
//  CardEntryView.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/2/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation
import UIKit

class CardEntryView {
    
    let view: UIView
    private var elements = [UIView]()
    
    private let DISTANCE_FROM_SIDES: CGFloat = 20
    private let DISTANCE_BETWEEN_ITEMS: CGFloat = 20
    
    init(withView view: UIView) {
        // blah
        self.view = view
        elements += [scrollView, contentView, subtitleLabel, titleLabel, splashImage, exitButton]
        for element in elements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    // Public functions
    
    public func getElements() -> [UIView] {
        return [scrollView]
    }
    
    // NOTE: Order matters when adding constraints
    public func addConstraints() {
        scrollViewConstraints()
        contentViewConstraints()
        splashImageConstraints()
        subtitleLabelConstraints()
        titleLabelConstraints()
        exitButtonConstraints()
    }
    
    public func setData(wtihData data: CardData) {
        titleLabel.text = data.getTitle()
        subtitleLabel.text = data.getSubtitle().uppercased()
        
        let entryData = data.getEntryData()
        let orderedEntryData = Utilities.getOrderedDictionary(fromDic: entryData)
        var previousItem: UIView?
        
        for i in 0 ..< orderedEntryData.count {
            var item = UIView()
            let dataPair = orderedEntryData[i]
            let key = dataPair![0]
            let value = dataPair![1]
            
            if key.contains("p") {
                let p = EntryParagraph()
                p.text = value
                item = p
            } else if key.contains("img") {
                let img = UIImageView()
                img.backgroundColor = Colors.highlight
                img.heightAnchor.constraint(equalToConstant: 250).isActive = true
                img.layer.cornerRadius = 25
                item = img
            } else if key.contains("href") {
                let href = RoundButton()
                href.setTitle("View", for: .normal)
                href.titleLabel?.font = Fonts.button
                item = href
            }
            
            item.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(item)
            item.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
            item.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
            if previousItem != nil {
                item.topAnchor.constraint(equalTo: previousItem!.bottomAnchor, constant: DISTANCE_BETWEEN_ITEMS).isActive = true
            } else {
                item.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: DISTANCE_BETWEEN_ITEMS * 3).isActive = true
            }
            previousItem = item
        }
    }
    
    // Private functions (UI setup and constraint setup)
    
    private let scrollView: UIScrollView = {
        let subview = UIScrollView()
        subview.alwaysBounceVertical = true
        subview.contentInset.top = 0
        return subview
    }()
    
    private func scrollViewConstraints() {
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // Scroll view can only have 1 subview (a content view)
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private func contentViewConstraints() {
        scrollView.addSubview(contentView)
        contentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 1800).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        scrollView.contentSize = CGSize.init(width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
    
    private let subtitleLabel: UILabel = {
        let label = SubtitleLabel()
        label.text = "test subtitle"
        return label
    }()
    
    private func subtitleLabelConstraints() {
        contentView.addSubview(subtitleLabel)
        subtitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: splashImage.bottomAnchor, constant: DISTANCE_BETWEEN_ITEMS).isActive = true
    }
    
    private let titleLabel: UILabel = {
        let label = TitleLabel()
        label.text = "Card Entry"
        return label
    }()
    
    private func titleLabelConstraints() {
        contentView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        titleLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor).isActive = true
    }
    
    private let splashImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = Colors.highlight
        return imageView
    }()
    
    private func splashImageConstraints() {
        contentView.addSubview(splashImage)
        splashImage.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        splashImage.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        splashImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
        splashImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    }
    
    private let exitButton: UIButton = {
        let button = ExitButton()
        button.titleLabel?.font = Fonts.button
        return button
    }()
    
    private func exitButtonConstraints() {
        contentView.addSubview(exitButton)
        exitButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        exitButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
    }
    
    public func getExitButton() -> UIButton {
        return exitButton
    }
    
}
