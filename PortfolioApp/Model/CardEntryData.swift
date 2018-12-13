//
//  CardEntryData.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/14/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation
import UIKit

class CardEntryData {
    
    private var data: [String : UIView] = [:]
    
    init(withDataFromFirebase data: [String : Any]) {
        for (dataKey, dataValue) in data {
            var newValue: UIView = UIView()
            
            if dataKey.contains("paragraph") {
                let paragraph = EntryParagraph()
                
                paragraph.text = (dataValue as! String)
                
                newValue = paragraph
            } else if dataKey.contains("image") {
                let image = EntryImage(frame: CGRect())
                let properties = (dataValue as! [String : Any])
                
                for (propertyKey, propertyValue) in properties {
                    if propertyKey == "caption" {
                        // Set the image's caption
                        image.setCaption(withText: (propertyValue as! String))
                    } else if propertyKey == "imageHeight" {
                        // Set the image's height constraint
                        image.setImageHeight(withNum: (propertyValue as! Int))
                    } else if propertyKey == "imageURL" {
                        // Load the image
                        image.setImageURL(withURL: (propertyValue as! String))
                    }
                }
                
                newValue = image
            } else if dataKey.contains("buttonLink") {
                // Create the button link
                let buttonLink = EntryButtonLink(type: .system)
                let properties = (dataValue as! [String : String])
                
                for (propertyKey, propertyValue) in properties {
                    if propertyKey == "text" {
                        // Set the caption
                        buttonLink.setText(withTxt: propertyValue)
                    } else if propertyKey == "href" {
                        // Set the link url
                        buttonLink.setHref(withURL: propertyValue)
                    }
                }
                
                newValue = buttonLink
            } else if dataKey.contains("appLink") {
                // Create the app link
                let appLink = EntryAppLink(type: .system)
                let properties = (dataValue as! [String : String])
                
                for (propertyKey, propertyValue) in properties {
                    if propertyKey == "caption" {
                        // Set the caption
                        appLink.setCaption(withText: propertyValue)
                    } else if propertyKey == "href" {
                        // Set the link url
                        appLink.setHref(withURL: propertyValue)
                    } else if propertyKey == "imageURL" {
                        // Set the image url
                        appLink.setImageURL(withImageURL: propertyValue)
                    } else if propertyKey == "title" {
                        // Set the title
                        appLink.setTitle(withText: propertyValue)
                    }
                }
                
                newValue = appLink
            }
            
            self.data[dataKey] = newValue
        }
    }
    
    func getData() -> [String : UIView] {
        return self.data
    }
    
}
