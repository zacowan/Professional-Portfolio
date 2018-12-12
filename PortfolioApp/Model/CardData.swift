//
//  CardData.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/7/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation
import UIKit

class CardData {
    
    private var title: String?
    private var subtitle: String?
    private var leading: String?
    private var imageUrlString: String?
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
                imageUrlString = (value as! String)
            }
        }
    }
    
    func setEntryData(withDataFromFirebase data: [String : Any]) {
        entryData = CardEntryData(withDataFromFirebase: data)
    }
    
    func getEntryData() -> [String : UIView] {
        return entryData!.getData()
    }
    
    func getTitle() -> String {
        return title!
    }
    
    func getSubtitle() -> String {
        return subtitle!
    }
    
    func getLeading() -> String {
        return leading!
    }
    
    func getImageUrlString() -> String {
        return imageUrlString!
    }
    
}
