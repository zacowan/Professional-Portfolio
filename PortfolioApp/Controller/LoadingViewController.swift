//
//  LoadingViewController.swift
//  PortfolioApp
//
//  Created by Zachary Cowan on 12/3/18.
//  Copyright © 2018 Zachary Cowan. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private var loadingView: LoadingView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = Colors.background
        
        // Add the UI
        self.loadingView = LoadingView(withView: view)
        let viewModel = self.loadingView!
        
        let viewElements = viewModel.getElements()
        for element in viewElements {
            view.addSubview(element)
        }
        viewModel.addConstraints()
        
        viewModel.startStopLoadingIndicator()
        
        viewModel.getRetryButton().addTarget(self, action: #selector(retryFetchData), for: .touchUpInside)
        // Do stuff
        
    }
    
    @objc private func retryFetchData() {
        loadingView!.showHideRetryButton()
        loadingView!.setLeading("Performing complex mathematical operations...")
        loadingView!.startStopLoadingIndicator()
        DataLoader.shared.fetchData(withVC: self)
    }
    
    func errorFetchingData(withMsg message: String) {
        loadingView!.setLeading(message)
        loadingView!.showHideRetryButton()
        loadingView!.startStopLoadingIndicator()
    }

}
