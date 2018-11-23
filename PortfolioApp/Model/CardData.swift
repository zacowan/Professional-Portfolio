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
    private var entryData: CardEntryData?
    
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
    
    public func setEntryData(withDataFromFirebase data: [String : Any]) {
        entryData = CardEntryData(withDataFromFirebase: data)
    }
    
    public func getEntryData() -> [String : String] {
        return entryData!.getData()
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
