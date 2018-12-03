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
    private var imageData: Data?
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
                let session = URLSession(configuration: .default)
                
                let url = URL(string: value as! String)!
                
                let task = session.dataTask(with: url) { (data, response, error) in
                    if error == nil && data != nil {
                        self.imageData = data
                    }
                }
                
                task.resume()
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
    
    public func getImage() -> UIImage? {
        if imageData != nil {
            return UIImage(data: imageData!)
        } else {
            return UIImage()
        }
    }
    
}
