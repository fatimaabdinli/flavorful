//
//  HeaderView.swift
//  flavorful
//
//  Created by Fatima Abdinli on 08.05.24.
//

import UIKit

enum SegmentType: String  {
    case Country
    case Category
}

class HeaderView: UICollectionReusableView {
    @IBOutlet weak var segmentView: UISegmentedControl!

    var segmentCallback: ((SegmentType) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        segmentView.addTarget(self, action: #selector(segmentClicked), for: .valueChanged)
    }
    
    
    @objc func segmentClicked() {
        switch segmentView.selectedSegmentIndex {
        case 0:
            segmentCallback?(.Country)
        case 1:
            segmentCallback?(.Category)
        default:
            segmentCallback?(.Country)
        }
    }
}
