//
//  Utilities.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/23/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation

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
    
}