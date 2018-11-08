//
//  CardData.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/7/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation

class CardData {
    
    private var title: String?
    private var subtitle: String?
    private var leading: String?
    private var image: String?
    
    init(withDataFromFirebase data: [String : String]) {
        for (key, value) in data {
            if key == "title" {
                title = value
            } else if key == "subtitle" {
                subtitle = value
            } else if key == "leading" {
                leading = value
            } else if key == "image" {
                image = value
            }
        }
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
    
}
