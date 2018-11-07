//
//  CardData.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/7/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation

class CardData {
    
    private var cardInformation = [String]()
    private var title: String?
    private var subtitle: String?
    private var leading: String?
    private var image: String?
    
    init(withDataFromFirebase data: [String]) {
        for element in data {
            cardInformation.append(element)
        }
        title = cardInformation[0]
        subtitle = cardInformation[1]
        leading = cardInformation[2]
        image = cardInformation[3]
    }
    
    public func getTitle() -> String {
        return title!
    }
    
    public func getSubtitle() -> String {
        return subtitle!
    }
    
    public func getLeading() -> String {
        return leading!
    }
    
    public func getImage() -> String {
        return image!
    }
    
    public func getCardInformation() -> [String] {
        return cardInformation
    }
    
}
