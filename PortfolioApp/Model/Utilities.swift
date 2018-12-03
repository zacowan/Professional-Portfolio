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
    
    public static func getOrderedDictionary(fromDic dic: [String : String]) -> [Int : [String]] {
        var orderedDictionary: [Int : [String]] = [:]
        for index in 0 ..< dic.count {
            let key = findItemInDictionary(withDic: dic, withIndex: index)!
            let value = dic[key]!
            orderedDictionary[index] = [key, value]
        }
        return orderedDictionary
    }
    
    private static func findItemInDictionary(withDic dic: [String : String], withIndex i: Int) -> String? {
        for (key, _) in dic {
            if key.contains("\(i)") {
                return key
            }
        }
        return nil
    }
    
    public static func loadImageFromUrl(_ urlString: String?, withImageView imageView: UIImageView) {
        let url = URL(string: urlString!)!
        var data: Data?
        
        DispatchQueue.global(qos: .background).async {
            let imageData: NSData? = NSData(contentsOf: url)
            
            data = imageData! as Data
            
            imageView.image = UIImage(data: data!)
        }
        
    }
    
}
