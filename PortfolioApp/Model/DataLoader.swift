//
//  DataLoader.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 12/3/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import Foundation
import Firebase


//TODO: Add a part that retrieves data ONCE at the beginning and stores it.
class DataLoader {
    
    public static var data: [String : [CardData]] = [:]
    
    public static func fetchData(_ database: Firestore) {
        for subtitle in TabBarController.subtitles {
            let collectionName = "\(subtitle.lowercased())Cards"
            let collection = database.collection(collectionName)
            var dataCollection = [CardData]()
            
            collection.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting card documents: \(err)")
                } else {
                    print("Document retrieval successful for \(collectionName)!")
                    let documents = querySnapshot!.documents
                    for document in documents {
                        if !(document.documentID.contains("Entry")) {
                            let data = CardData(withDataFromFirebase: document.data())
                            let entryData = findCardEntryDocument(withCard: document.documentID, withDocs: documents)?.data()
                            if let unwrappedEntryData = entryData {
                                data.setEntryData(withDataFromFirebase: unwrappedEntryData)
                            }
                            dataCollection.append(data)
                        }
                    }
                    DataLoader.data[subtitle] = dataCollection
                }
            }
        }
        
    }
    
    private static func findCardEntryDocument(withCard card: String, withDocs docs: [QueryDocumentSnapshot]) -> QueryDocumentSnapshot? {
        for doc in docs {
            if doc.documentID == "\(card) Entry" {
                return doc
            }
        }
        return nil
    }
    
}
