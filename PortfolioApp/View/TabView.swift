//
//  TabView.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/1/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation
import UIKit

// NOTES: When adding new elements, append them to the array and add their constraints to the addConstrains() function

class TabView {
    private let view: UIView
    private var elements = [UIView]()
    
    // Values for quick changes
    private let DISTANCE_FROM_SIDES: CGFloat = 30
    private let DISTANCE_FROM_BOTTOM: CGFloat = 10
    
    init(withView view: UIView, withSubtitle subtitle: String) {
        self.view = view
        elements += [topContainer, titleText, subtitleText]
        for element in elements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        let capitalizedSubtitle = subtitle.uppercased()
        subtitleText.text = capitalizedSubtitle
    }
    
    // Public functions
    
    public func getElements() -> [UIView] {
        return elements
    }
    
    public func addConstraints() {
        topContainerConstraits()
        subtitleTextConstraints()
        titleTextConstraints()
    }
    
    public func getTopContainer() -> UIView {
        return topContainer
    }
    
    // Private functions (UI setup and constraint setup)
    
    private let topContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.background
        return view
    }()
    
    private func topContainerConstraits() {
        topContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topContainer.heightAnchor.constraint(equalToConstant: 125).isActive = true
    }
    
    private let titleText: UILabel = {
        let label = TitleLabel()
        label.font = Fonts.mainTitle
        label.text = "Zachary Cowan"
        return label
    }()
    
    private func titleTextConstraints() {
        topContainer.addSubview(titleText)
        titleText.leftAnchor.constraint(equalTo: topContainer.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        titleText.rightAnchor.constraint(equalTo: topContainer.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        titleText.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: -DISTANCE_FROM_BOTTOM).isActive = true
    }
    
    private let subtitleText: UILabel = {
        let label = SubtitleLabel()
        label.font = Fonts.mainSubtitle
        label.text = "SECTION"
        return label
    }()
    
    private func subtitleTextConstraints() {
        topContainer.addSubview(subtitleText)
        subtitleText.leftAnchor.constraint(equalTo: topContainer.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        subtitleText.rightAnchor.constraint(equalTo: topContainer.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        subtitleText.bottomAnchor.constraint(equalTo: titleText.topAnchor).isActive = true
    }
    
}
