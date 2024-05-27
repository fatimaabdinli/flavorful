//
//  SearchVM.swift
//  flavorful
//
//  Created by Fatima Abdinli on 18.05.24.
//

import Foundation

class SearchVM {
    private var recipeSearchResults: [RecipeResult]?
    var recipeList: [GivenRecipeCellProtocol] = []
    var showLoading: ((Bool) -> Void)?
    var successCallback: (() -> Void)?
    var errorCallback: ((String) -> Void)?
    
//    func getRecipeList() {
//        if let recipeSearchResults = recipeSearchResults, !recipeSearchResults.isEmpty {
//            recipeList = recipeSearchResults
//            successCallback?()
//        } else {
//            getRecipeListRequest(type: type, value: value)
//        }
//    }
    
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
//                print(responseData)
                self.recipeSearchResults = responseData
                recipeList = recipeSearchResults ?? []
                self.successCallback?()
            }
        })
    }
}
