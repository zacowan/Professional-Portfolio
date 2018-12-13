//
//  Utilities.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/23/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static let shared = Utilities()
    
    // Used in conjunction with the UIImageView URL extension
    let imageCache = NSCache<NSString, UIImage>()
    
    func getOrderedDictionary(fromDic dic: [String : UIView]) -> [Int : [String : UIView]] {
        var orderedDictionary: [Int : [String : UIView]] = [:]
        for index in 0 ..< dic.count {
            let key = findItemInDictionary(withDic: dic, withIndex: index)!
            let value = dic[key]!
            orderedDictionary[index] = [key : value]
        }
        return orderedDictionary
    }
    
    private func findItemInDictionary(withDic dic: [String : UIView], withIndex i: Int) -> String? {
        for (key, _) in dic {
            if key.contains("\(i)") {
                return key
            }
        }
        return nil
    }
    
}

// Idea for this code retrieved from: https://stackoverflow.com/questions/25180443/adjust-uilabel-height-to-text

extension UILabel {
    
    func calculateHeightBasedOnText(width: CGFloat) -> CGFloat {
        let newLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        newLabel.numberOfLines = self.numberOfLines
        newLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        newLabel.font = self.font
        newLabel.text = self.text!
        
        newLabel.sizeToFit()
        return newLabel.frame.standardized.height
    }
    
}

// Source for below code: https://stackoverflow.com/questions/37018916/swift-async-load-image

extension UIImageView {
    
    func imageFromServerURL(_ URLString: String, placeHolder: UIImage?) {
        
        self.image = nil
        if let cachedImage = Utilities.shared.imageCache.object(forKey: NSString(string: URLString)) {
            self.image = cachedImage
            return
        }
        
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                //print("RESPONSE FROM API: \(response)")
                if error != nil {
                    print("ERROR LOADING IMAGES FROM URL: \(error!)")
                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            Utilities.shared.imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                            self.image = downloadedImage
                        }
                    }
                }
            }).resume()
        }
    }
    
}
