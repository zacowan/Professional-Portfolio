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
    private let DISTANCE_FROM_BOTTOM: CGFloat = 20
    private var IMAGE_HEIGHT: CGFloat = 400
    private var SUBIMAGE_HEIGHT: CGFloat = 250
    
    private var scrollViewHeight: CGFloat = 0
    private var hrefButton: UIButton?
    private var href: String?
    
    init(withView view: UIView) {
        // Setup
        IMAGE_HEIGHT = view.frame.size.height / 1.5
        SUBIMAGE_HEIGHT = view.frame.size.height / 2.5
        scrollViewHeight += IMAGE_HEIGHT + DISTANCE_BETWEEN_ITEMS + subtitleLabel.intrinsicContentSize.height + titleLabel.intrinsicContentSize.height
        self.view = view
        elements += [scrollView, subtitleLabel, titleLabel, splashImage, exitButton]
        for element in elements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    // Public functions
    
    func getExitButton() -> UIButton {
        return exitButton
    }
    
    func getHrefButton() -> UIButton? {
        return hrefButton
    }
    
    func getHref() -> String? {
        return href
    }
    
    func getElements() -> [UIView] {
        return [scrollView, exitButton]
    }
    
    // NOTE: Order matters when adding constraints
    func addConstraints() {
        scrollViewConstraints()
        splashImageConstraints()
        subtitleLabelConstraints()
        titleLabelConstraints()
        exitButtonConstraints()
    }
    
    func setData(wtihData data: CardData, withSplashImage spImage: UIImage) {
        titleLabel.text = data.getTitle()
        subtitleLabel.text = data.getSubtitle().uppercased()
        splashImage.image = spImage
        
        let entryData = data.getEntryData()
        let orderedEntryData = Utilities.shared.getOrderedDictionary(fromDic: entryData)
        
        var previousElement: UIView?
        
        for i in 0 ..< orderedEntryData.count {
            let dataDictionary = orderedEntryData[i]
            var dataKey: String?
            var dataValue: UIView?
            
            for (key, value) in dataDictionary! {
                dataKey = key
                dataValue = value
            }
            
            dataValue!.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(dataValue!)
            
            // Perform any additional setup and calculate the approximate height of the scroll view
            if dataKey!.contains("paragraph") {
                scrollViewHeight += dataValue!.intrinsicContentSize.height
            } else if dataKey!.contains("image") {
                scrollViewHeight += (dataValue! as! EntryImage).computedHeight
            } else if dataKey!.contains("buttonLink") {
                scrollViewHeight += (dataValue! as! EntryButtonLink).getHeight()
            } else if dataKey!.contains("appLink") {
                scrollViewHeight += (dataValue! as! EntryAppLink).computedHeight
            }
            
            if previousElement != nil {
                
            } else {
                
            }
            
            scrollView.contentSize.height = scrollViewHeight
        }
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
        //imageView.backgroundColor = Colors.highlight
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private func splashImageConstraints() {
        scrollView.addSubview(splashImage)
        splashImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        splashImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        splashImage.heightAnchor.constraint(equalToConstant: view.frame.size.height / 1.5).isActive = true
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
    
}