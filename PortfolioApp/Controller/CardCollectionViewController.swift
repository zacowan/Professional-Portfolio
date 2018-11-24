//
//  CardCollectionViewController.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/2/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "CardCell"

class CardCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var subtitle: String?
    private let database = AppDelegate.getDatabase()
    private var cardData = [CardData]()
    private var currentCell = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(Card.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        // Add the UI
        let tabView = TabView(withView: view, withSubtitle: subtitle!)
        let viewElements = tabView.getElements()
        for element in viewElements {
            view.addSubview(element)
        }
        tabView.addConstraints()
        setupCollectionView(usingView: tabView)
        self.collectionView.reloadData()
    }
    
    init(withSubtitle subtitle: String) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.subtitle = subtitle
        let collectionName = "\(subtitle.lowercased())Cards"
        let colReference = database.collection(collectionName)
        colReference.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting card documents: \(err)")
            } else {
                let documents = querySnapshot!.documents
                for document in documents {
                    if !(document.documentID.contains("Entry")) {
                        let data = CardData(withDataFromFirebase: document.data())
                        let entryData = self.findCardEntryDocument(withCard: document.documentID, withDocs: documents)?.data()
                        if let unwrappedEntryData = entryData {
                            data.setEntryData(withDataFromFirebase: unwrappedEntryData)
                        }
                        self.cardData.append(data)
                        self.collectionView.reloadData()
                    }
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView(usingView tabView: TabView) {
        collectionView.backgroundColor = Colors.background
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: tabView.getTopContainer().bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return cardData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 405)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Card
        // Configure the cell
        // Iterate over data and set the contents
        let data = cardData[currentCell]
        cell.setParentViewController(withViewController: self)
        cell.setData(withData: data)
        currentCell += (currentCell < cardData.count - 1) ? 1 : 0
        return cell
    }
    
    private func findCardEntryDocument(withCard card: String, withDocs docs: [QueryDocumentSnapshot]) -> QueryDocumentSnapshot? {
        for doc in docs {
            if doc.documentID == "\(card) Entry" {
                return doc
            }
        }
        return nil
    }
    
    public func getSubtitle() -> String? {
        return subtitle
    }

}
