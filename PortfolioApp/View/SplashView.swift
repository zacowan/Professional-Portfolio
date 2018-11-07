//
//  SplashView.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 10/31/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation
import UIKit

// NOTES: When adding new elements, append them to the array and add their constraints to the addConstrains() function

class SplashView {
    private let view: UIView
    private var elements = [UIView]()
    
    // Values for quick changes
    private let DISTANCE_FROM_SIDES: CGFloat = 30
    private let DISTANCE_FROM_BOTTOM: CGFloat = 40
    
    init(withView view: UIView) {
        self.view = view
        elements += [welcomeText, subtitleText, leadingText, exploreButton]
        for element in elements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    // Public functions
    
    public func getElements() -> [UIView] {
        return elements
    }
    
    public func addConstraints() {
        welcomeTextConstraints()
        subtitleTextConstraints()
        leadingTextConstraints()
        exploreButtonConstraints()
    }
    
    public func getButton() -> UIButton {
        return exploreButton
    }
    
    // Private functions (UI setup and constraint setup)
    
    private let welcomeText: UILabel = {
        let label = TitleLabel()
        label.font = Fonts.mainTitle
        label.text = "Welcome"
        return label
    }()
    
    private func welcomeTextConstraints() {
        welcomeText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        welcomeText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        welcomeText.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private let subtitleText: UILabel = {
        let label = SubtitleLabel()
        label.text = "PORTFOLIO"
        label.font = Fonts.mainSubtitle
        return label
    }()
    
    private func subtitleTextConstraints() {
        subtitleText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        subtitleText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        subtitleText.bottomAnchor.constraint(equalTo: welcomeText.topAnchor).isActive = true
    }
    
    private let leadingText: UILabel = {
        let label = LeadingLabel()
        label.font = Fonts.mainLeading
        label.text = "This portfolio project is designed to illustrate my ability as a programmer and designer."
        return label
    }()
    
    private func leadingTextConstraints() {
        leadingText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        leadingText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        leadingText.topAnchor.constraint(equalTo: welcomeText.bottomAnchor).isActive = true
    }
    
    private let exploreButton: UIButton = {
        let button = RoundButton(type: .system)
        button.setTitle("Let's Explore", for: .normal)
        button.titleLabel?.font = Fonts.button
        return button
    }()
    
    private func exploreButtonConstraints() {
        exploreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        exploreButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -DISTANCE_FROM_BOTTOM).isActive = true
    }
    
}
