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
    
    public static let shared = Utilities()
    
    // Used in conjunction with the UIImageView URL extension
    let imageCache = NSCache<NSString, UIImage>()
    
    public func getOrderedDictionary(fromDic dic: [String : String]) -> [Int : [String]] {
        var orderedDictionary: [Int : [String]] = [:]
        for index in 0 ..< dic.count {
            let key = findItemInDictionary(withDic: dic, withIndex: index)!
            let value = dic[key]!
            orderedDictionary[index] = [key, value]
        }
        return orderedDictionary
    }
    
    private func findItemInDictionary(withDic dic: [String : String], withIndex i: Int) -> String? {
        for (key, _) in dic {
            if key.contains("\(i)") {
                return key
            }
        }
        return nil
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
