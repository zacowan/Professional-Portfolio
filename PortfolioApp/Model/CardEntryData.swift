//
//  CardEntryData.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/14/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation

class CardEntryData {
    
    private var data: [String : String]
    
    init(withDataFromFirebase data: [String : Any]) {
        self.data = (data as! [String : String])
        print("Entry data: ")
        for (key, value) in data {
            print("\(key) , \(value)")
        }
    }
    
    public func getData() -> [String : String] {
        return data
    }
    
}