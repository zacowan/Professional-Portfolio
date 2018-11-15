//
//  CardEntryData.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/14/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation

class CardEntryData {
    
    private var title: String?
    private var subtitle: String?
    private var leading: String?
    private var image: String?
    
    init(withDataFromFirebase data: [String : Any]) {
        for (key, value) in data {
            if key == "title" {
                title = (value as! String)
            } else if key == "subtitle" {
                subtitle = (value as! String)
            } else if key == "leading" {
                leading = (value as! String)
            } else if key == "image" {
                image = (value as! String)
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
