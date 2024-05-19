//
//  SearchVM.swift
//  flavorful
//
//  Created by Fatima Abdinli on 18.05.24.
//

import Foundation

class SearchVM {
    private var recipeSearchResults: [RecipeResult]?
    var showLoading: ((Bool) -> Void)?
    
    // MARK: Network
    func getRecipeList(type: SegmentType, value: String?) {
        showLoading?(true)
        RecipeManager.shared.getRecipeList(segmentType: type, value: value ?? "", completion: { [weak self] responseData, errorString in
            guard let self = self else {return}
            self.showLoading?(false)
            if let errorString = errorString {
//                self.errorCallback?(errorString)
            } else if let responseData = responseData?.results {
                print(responseData)
                self.recipeSearchResults = responseData
//                self.successCallback?()
            }
        })
    }
}
