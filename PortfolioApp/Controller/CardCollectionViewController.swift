//
//  CardCollectionViewController.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 11/2/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CardCell"

class CardCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var subtitle: String?
    private var cardData = [CardData]()
    private let refreshControl = UIRefreshControl()
    
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
        
        // Add functionality to the refresh controller
        self.refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        self.collectionView.reloadData()
    }
    
    @objc private func refreshData() {
        DataLoader.shared.refreshData(withVC: self)
    }
    
    func updateViewAfterRefresh(success: Bool) {
        self.refreshControl.endRefreshing()
        self.collectionView.reloadData()
    }
    
    init(withSubtitle subtitle: String) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        self.subtitle = subtitle
        self.collectionView.refreshControl = refreshControl
        
        for data in DataLoader.shared.data[subtitle]! {
            cardData.append(data)
        }
        
        //collectionView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView(usingView tabView: TabView) {
        collectionView.backgroundColor = Colors.background
        //collectionView.showsVerticalScrollIndicator = false
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
        return CGSize(width: view.frame.size.width, height: view.frame.size.height / 1.5)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! Card
        // Configure the cell
        // Iterate over data and set the contents
        let data = cardData[indexPath.row]
        cell.setData(withData: data)
        return cell
    }
    
    public func getSubtitle() -> String? {
        return subtitle
    }

}
