//
//  Constants.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 10/31/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation
import UIKit

public struct Fonts {
    // List of all fonts to be used in the application
    
    // General
    static let button = UIFont(name: "AvenirNext-Bold", size: 21)
    static let navBar = UIFont(name: "AvenirNext-Regular", size: 12)
    
    // For main titles
    static let mainTitle = UIFont(name: "AvenirNext-Bold", size: 36)
    static let mainSubtitle = UIFont(name: "AvenirNext-Medium", size: 14)
    static let mainLeading = UIFont(name: "AvenirNext-Regular", size: 15)
    
    // For cards
    static let cardTitle = UIFont(name: "AvenirNext-Bold", size: 26)
    static let cardSubtitle = Fonts.mainSubtitle
    static let cardLeading = Fonts.mainLeading
    
    // For card entries
    static let cardEntryTitle = Fonts.cardTitle
    static let cardEntrySubtitle = Fonts.cardSubtitle
    static let cardEntryBody = UIFont(name: "AvenirNext-Medium", size: 15)
    static let cardEntryCaption = UIFont(name: "AvenirNext-Regular", size: 13)
    
}

public struct Colors {
    // List of all colors to be used in the application
    
    // Font colors
    public struct FontColors {
        
        static let titleText = #colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        static let subtitle = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 1)
        static let leading = Colors.FontColors.subtitle
        static let caption = Colors.FontColors.subtitle
        static let body = Colors.FontColors.subtitle
        static let button = Colors.background
        static let navbar = #colorLiteral(red: 0.7803921569, green: 0.7803921569, blue: 0.8, alpha: 1)
        
    }
    
    // General
    static let background = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
    static let highlight = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
    
    // Card
    static let cardBackground = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    // Card entries
    static let cardEntryBackground = Colors.cardBackground
    static let cardEntryCardBackground = Colors.background
    
}
