//
//  LoadingView.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 12/3/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation
import UIKit

// NOTES: When adding new elements, append them to the array and add their constraints to the addConstrains() function

class LoadingView {
    private let view: UIView
    private var elements = [UIView]()
    
    // Values for quick changes
    private let DISTANCE_FROM_SIDES: CGFloat = 30
    private let DISTANCE_BETWEEN: CGFloat = 40
    
    init(withView view: UIView) {
        self.view = view
        elements += [leadingText]
        for element in elements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    // Public functions
    
    public func getElements() -> [UIView] {
        return elements
    }
    
    public func addConstraints() {
        leadingTextConstraints()
    }
    
    // Private functions (UI setup and constraint setup)
    
    private let leadingText: UILabel = {
        let label = LeadingLabel()
        label.font = Fonts.mainLeading
        label.text = "Performing complex mathematical operations..."
        label.textAlignment = .center
        return label
    }()
    
    private func leadingTextConstraints() {
        leadingText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: DISTANCE_FROM_SIDES).isActive = true
        leadingText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -DISTANCE_FROM_SIDES).isActive = true
        leadingText.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
