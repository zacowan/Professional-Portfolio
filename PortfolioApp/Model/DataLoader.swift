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
    
    static let shared = DataLoader()
    
    let database: Firestore = Firestore.firestore()
    
    var data: [String : [CardData]] = [:]
    
    func fetchData(withVC VC: LoadingViewController) {
        var newData: [String : [CardData]] = [:]
        
        if Reachability.isConnectedToNetwork() {
            print("Connected to the internet! Performing data fetching...")
            
            for subtitle in TabBarController.subtitles {
                let collectionName = "\(subtitle.lowercased())Cards"
                let collection = database.collection(collectionName)
                var dataCollection = [CardData]()
                
                collection.getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting card documents: \(err)")
                        VC.errorFetchingData(withMsg: "Error fetching data: \(err as! String)")
                    } else {
                        print("Document retrieval successful for \(collectionName)!")
                        
                        let documents = querySnapshot!.documents
                        
                        for document in documents {
                            if !(document.documentID.contains("Entry")) {
                                print("Appending \(document.documentID) to \(collectionName).")
                                
                                let data = CardData(withDataFromFirebase: document.data())
                                let entryData = self.findCardEntryDocument(withCard: document.documentID, withDocs: documents)?.data()
                                
                                if let unwrappedEntryData = entryData {
                                    data.setEntryData(withDataFromFirebase: unwrappedEntryData)
                                }
                                
                                dataCollection.append(data)
                            }
                        }
                        newData[subtitle] = dataCollection
                        if newData.count >= 3 {
                            // Completion handler
                            self.data = newData
                            VC.completedFetchingData()
                        }
                    }
                }
            }
        } else {
            print("Not connected to the internet! Displaying error messages...")
            
            VC.errorFetchingData(withMsg: "Error fetching data: No internet connection.")
        }
    }
    
    func refreshData(withVC VC: CardCollectionViewController) {
        
        var newData: [String : [CardData]] = [:]
        
        if Reachability.isConnectedToNetwork() {
            print("Connected to the internet! Performing data refreshing...")
            
            for subtitle in TabBarController.subtitles {
                let collectionName = "\(subtitle.lowercased())Cards"
                let collection = database.collection(collectionName)
                var dataCollection = [CardData]()
                
                collection.getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting card documents: \(err)")
                        VC.updateViewAfterRefresh(success: false)
                    } else {
                        print("Document retrieval successful for \(collectionName)!")
                        
                        let documents = querySnapshot!.documents
                        
                        for document in documents {
                            if !(document.documentID.contains("Entry")) {
                                print("Appending \(document.documentID) to \(collectionName).")
                                
                                let data = CardData(withDataFromFirebase: document.data())
                                let entryData = self.findCardEntryDocument(withCard: document.documentID, withDocs: documents)?.data()
                                
                                if let unwrappedEntryData = entryData {
                                    data.setEntryData(withDataFromFirebase: unwrappedEntryData)
                                }
                                
                                dataCollection.append(data)
                            }
                        }
                        newData[subtitle] = dataCollection
                        if newData.count >= 3 {
                            // Completion handler
                            self.data = newData
                            VC.updateViewAfterRefresh(success: true)
                        }
                    }
                }
            }
        } else {
            print("Not connected to the internet! Cancelling refresh...")
            VC.updateViewAfterRefresh(success: false)
        }
    }
    
    private func findCardEntryDocument(withCard card: String, withDocs docs: [QueryDocumentSnapshot]) -> QueryDocumentSnapshot? {
        for doc in docs {
            if doc.documentID == "\(card) Entry" {
                return doc
            }
        }
        return nil
    }
    
}
