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
    private let DISTANCE_BETWEEN_TITLE_AND_CONTENT: CGFloat = 60
    private let DISTANCE_FROM_BOTTOM: CGFloat = 80
    private let IMAGE_HEIGHT: CGFloat = 400
    private let SUBIMAGE_HEIGHT: CGFloat = 250
    
    private var scrollViewHeight: CGFloat = 0
    
    init(withView view: UIView) {
        // blah
        scrollViewHeight += IMAGE_HEIGHT + DISTANCE_BETWEEN_ITEMS + subtitleLabel.intrinsicContentSize.height + titleLabel.intrinsicContentSize.height
        self.view = view
        elements += [scrollView, subtitleLabel, titleLabel, splashImage, exitButton]
        for element in elements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    // Public functions
    
    public func getElements() -> [UIView] {
        return [scrollView, exitButton]
    }
    
    // NOTE: Order matters when adding constraints
    public func addConstraints() {
        scrollViewConstraints()
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
                scrollViewHeight += p.intrinsicContentSize.height
                item = p
            } else if key.contains("img") {
                let img = UIImageView()
                img.backgroundColor = Colors.highlight
                img.layer.cornerRadius = 25
                scrollViewHeight += SUBIMAGE_HEIGHT
                item = img
            } else if key.contains("href") {
                let href = RoundButton()
                href.setTitle("View", for: .normal)
                href.titleLabel?.font = Fonts.button
                scrollViewHeight += 60
                item = href
            }
            
            scrollView.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
            
            if key.contains("p") {
                item.leftAnchor.constraint(equalTo: view.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
                item.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
            } else if key.contains("img") {
                item.heightAnchor.constraint(equalToConstant: SUBIMAGE_HEIGHT).isActive = true
                item.leftAnchor.constraint(equalTo: view.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
                item.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
            } else if key.contains("href") {
                item.widthAnchor.constraint(equalToConstant: 200).isActive = true
                item.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            }

            if previousItem != nil {
                item.topAnchor.constraint(equalTo: previousItem!.bottomAnchor, constant: DISTANCE_BETWEEN_ITEMS).isActive = true
                scrollViewHeight += DISTANCE_BETWEEN_ITEMS
            } else {
                item.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: DISTANCE_BETWEEN_TITLE_AND_CONTENT).isActive = true
                scrollViewHeight += DISTANCE_BETWEEN_TITLE_AND_CONTENT
            }
            previousItem = item
        }
        scrollViewHeight += DISTANCE_BETWEEN_ITEMS
        scrollViewHeight += DISTANCE_FROM_BOTTOM
        print(scrollViewHeight)
        scrollView.contentSize.height = scrollViewHeight
    }
    
    // Private functions (UI setup and constraint setup)
    
    private let scrollView: UIScrollView = {
        let subview = UIScrollView()
        subview.alwaysBounceVertical = true
        subview.contentSize.height = 9000
        subview.contentInsetAdjustmentBehavior = .never
        return subview
    }()
    
    private func scrollViewConstraints() {
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private let subtitleLabel: UILabel = {
        let label = SubtitleLabel()
        label.text = "test subtitle"
        return label
    }()
    
    private func subtitleLabelConstraints() {
        scrollView.addSubview(subtitleLabel)
        subtitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: splashImage.bottomAnchor, constant: DISTANCE_BETWEEN_ITEMS).isActive = true
    }
    
    private let titleLabel: UILabel = {
        let label = TitleLabel()
        label.text = "Card Entry"
        return label
    }()
    
    private func titleLabelConstraints() {
        scrollView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        titleLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor).isActive = true
    }
    
    private let splashImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = Colors.highlight
        return imageView
    }()
    
    private func splashImageConstraints() {
        scrollView.addSubview(splashImage)
        splashImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        splashImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        splashImage.heightAnchor.constraint(equalToConstant: IMAGE_HEIGHT).isActive = true
        splashImage.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    }
    
    private let exitButton: UIButton = {
        let button = ExitButton()
        button.titleLabel?.font = Fonts.button
        return button
    }()
    
    private func exitButtonConstraints() {
        exitButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
    }
    
    public func getExitButton() -> UIButton {
        return exitButton
    }
    
}
