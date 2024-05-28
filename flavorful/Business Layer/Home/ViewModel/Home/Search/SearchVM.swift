//
//  SearchVM.swift
//  flavorful
//
//  Created by Fatima Abdinli on 18.05.24.
//

import Foundation

class SearchVM {
    var recipeList: [GivenRecipeCellProtocol] = []
    var showLoading: ((Bool) -> Void)?
    var successCallback: (() -> Void)?
    var errorCallback: ((String) -> Void)?
    
    func getRecipeCount() -> Int {
        recipeList.count
    }
    
    // MARK: Network
    func getRecipeListRequest(type: SegmentType, value: String?) {
        showLoading?(true)
        RecipeManager.shared.getRecipeList(segmentType: type, value: value ?? "", completion: { [weak self] responseData, errorString in
            guard let self = self else {return}
            self.showLoading?(false)
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData?.results {
                recipeList = responseData ?? []
                self.successCallback?()
            }
        })
    }
    
    func searchRecipeListRequest(type: SegmentType, value: String?, query: String) {
        showLoading?(true)
        SearchManager.shared.searchRecipeList(segmentType: type, value: value ?? "", query: query, completion: { [weak self] responseData, errorString in
            guard let self = self else {return}
            self.showLoading?(false)
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData?.results {
                recipeList = responseData ?? []
                self.successCallback?()
            }
        })
    }
}
