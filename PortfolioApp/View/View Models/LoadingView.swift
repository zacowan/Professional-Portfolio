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
    
    private let loadingStatements: [String] = ["Performing complex mathematical operations",
                                               "Initiating warp drive",
                                               "Analyzing logical fallacies",
                                               "Initiating J.A.R.V.I.S. protocol",
                                               "Accounting for technicalities"]
    
    // Values for quick changes
    private let DISTANCE_FROM_SIDES: CGFloat = 30
    private let DISTANCE_BETWEEN: CGFloat = 40
    
    init(withView view: UIView) {
        self.view = view
        elements += [leadingText, retryButton, loadingIndicator]
        for element in elements {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        self.leadingText.text = "\(loadingStatements[Int.random(in: 0 ..< loadingStatements.count)])..."
    }
    
    // Public functions
    
    func getElements() -> [UIView] {
        return elements
    }
    
    func addConstraints() {
        leadingTextConstraints()
        loadingIndicatorConstraints()
        retryButtonConstraints()
    }
    
    func setLeading(_ text: String) {
        leadingText.text = text
    }
    
    func showHideRetryButton() {
        retryButton.isHidden = retryButton.isHidden ? false : true
    }
    
    func getRetryButton() -> UIButton {
        return retryButton
    }
    
    func startStopLoadingIndicator() {
        loadingIndicator.isAnimating ? loadingIndicator.stopAnimating() : loadingIndicator.startAnimating()
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
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    private func loadingIndicatorConstraints() {
        loadingIndicator.topAnchor.constraint(equalTo: leadingText.bottomAnchor, constant: DISTANCE_BETWEEN).isActive = true
        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private let retryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Try Again", for: .normal)
        button.titleLabel?.font = Fonts.cardLeading
        button.setTitleColor(Colors.highlight, for: .normal)
        button.isHidden = true
        return button
    }()
    
    private func retryButtonConstraints() {
        retryButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        retryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}
