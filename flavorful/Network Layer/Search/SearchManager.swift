//
//  SearchManager.swift
//  flavorful
//
//  Created by Fatima Abdinli on 27.05.24.
//

import Foundation

class SearchManager {
    static let shared = SearchManager()
    
    func searchRecipeList(
        segmentType: SegmentType,
        value: String,
        query: String,
        completion: @escaping ((RecipeModel?, String?) -> Void)) {
        let url = "\(RecipeHelper.recipeSearch.path)&\(segmentType == .Category ? "type" : "cuisine")=\(value)&addRecipeInformation=true&query=\(query)"
        NetworkManager.shared.request(
            type: RecipeModel.self,
            url: url,
            header: NetworkHelper.shared.header,
            method: .get) { [weak self] response in
                guard let _ = self else {return}
                switch response {
                case .success(let success):
                    completion(success, nil)
                case .failure(let failure):
                    completion(nil, failure.rawValue)
                    break
                }
            }
    }
}
