//
//  HomeVC.swift
//  flavorful
//
//  Created by Fatima Abdinli on 05.05.24.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    private var segmentType: SegmentType = .Country
    
    let viewModel = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true   , animated: true)
        viewModel.getListOfType(type: .Country)
        setupView()
        setupTarget()
        print(UserDefaultsHelper.getString(key: "user_name") ?? "")
    }
    
    fileprivate func setupTarget() {
    }
    
    @objc func backAction() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
               vc.modalPresentationStyle = .fullScreen
               present(vc, animated: true)
    }
    
    fileprivate func segmentAction(type: SegmentType) {
        segmentType = type
        viewModel.getListOfType(type: type)
    }
    
    fileprivate func setupView() {
        headerLabel.text = "Hello, \(UserDefaultsHelper.getString(key: "user_name") ?? "")! \n Let's start cooking!"
        headerLabel.textColor = .white
        collectionView.registerNib(with: "RecipeCell")
        collectionView.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
        configureViewModel()
    }
    
    fileprivate func configureViewModel() {
        viewModel.successCB = { [weak self] in
            guard let self = self else {return}
            reloadCollectionView()
        }
    }
    
    fileprivate func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HomeVC: UICollectionViewDelegate,
                  UICollectionViewDataSource,
                  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getListCount()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width - 16, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 16, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellClass: RecipeCell.self, indexPath: indexPath)
        let model = viewModel.recipeList[indexPath.row]
        cell.configureCell(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
        headerView.segmentCallback = { [weak self] segmentType in
            guard let self = self else {return}
            self.segmentAction(type: segmentType)
        }
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
               vc.modalPresentationStyle = .fullScreen
        let item = viewModel.recipeList[indexPath.row]
        vc.type = segmentType
        vc.value = item.id
        present(vc, animated: true)
        
    }
}

