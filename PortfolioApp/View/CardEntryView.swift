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
    
    init(withView view: UIView) {
        // blah
        self.view = view
        elements += [scrollView, contentView, subtitleLabel, titleLabel, splashImage]
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
    }
    
    public func setData(wtihData data: CardData) {
        titleLabel.text = data.getTitle()
        subtitleLabel.text = data.getSubtitle().uppercased()
        let entryData = data.getEntryData()
        var previousItem: UIView?
        for (key, value) in entryData {
            var item = UIView()
            if key.contains("p") {
                item = EntryParagraph()
                (item as! UILabel).text = value
            } else if key.contains("img") {
                
            } else if key.contains("href") {
                
            }
            item.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(item)
            item.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
            item.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
            if previousItem != nil {
                item.topAnchor.constraint(equalTo: previousItem!.bottomAnchor, constant: 20).isActive = true
            } else {
                item.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 80).isActive = true
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
        contentView.heightAnchor.constraint(equalToConstant: 9000).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
    }
    
    private let subtitleLabel: UILabel = {
        let label = SubtitleLabel()
        label.text = "test subtitle"
        return label
    }()
    
    private func subtitleLabelConstraints() {
        contentView.addSubview(subtitleLabel)
        subtitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: splashImage.bottomAnchor, constant: 20).isActive = true
    }
    
    private let titleLabel: UILabel = {
        let label = TitleLabel()
        label.text = "Card Entry"
        return label
    }()
    
    private func titleLabelConstraints() {
        contentView.addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
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
    
}
