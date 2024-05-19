//
//  SearchVC.swift
//  flavorful
//
//  Created by Fatima Abdinli on 18.05.24.
//

import UIKit

class SearchVC: UIViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    public var type: SegmentType?
    public var value: String?
    var showSearchField = false
    var viewModel = SearchVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(type, value)
        setupView()
        setupTarget()
        viewModel.getRecipeList(type: type ?? .Country, value: value)
    }

    fileprivate func setupView() {
        collectionView.registerNib(with: "GivenRecipesCell")
       
    }
    
    fileprivate func setupTarget() {
        searchButton.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        dismissButton.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
    }
    
    @objc func searchAction() {
        print(#function)
        showSearchField.toggle()
        
        UIView.transition(with: searchField,
                          duration: 1.0,
                          options: .transitionFlipFromBottom,
                          animations: { [weak self] in
                guard let self = self else {return}
            sortButton.isHidden = showSearchField
                searchField.isHidden = !showSearchField
                searchField.text = ""
        })
    }
    
    @objc func dismissAction() {
        self.dismiss(animated: true)
    }
}

extension SearchVC: UICollectionViewDelegate,
                  UICollectionViewDataSource,
                  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 16, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellClass: GivenRecipesCell.self, indexPath: indexPath)
        return cell
    }
}


