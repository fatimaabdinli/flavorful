//
//  RecipeManager.swift
//  NetworkProject
//
//  Created by Fatima Abdinli on 19.05.24.
//

import Foundation

class RecipeManager {
    static let shared = RecipeManager()
   
    func getRecipeList(
        segmentType: SegmentType,
        value: String,
        completion: @escaping ((RecipeModel?, String?) -> Void)) {
        let url = "\(RecipeHelper.recipeSearch.path)&\(segmentType == .Category ? "type" : "cuisine")=\(value)&addRecipeInformation=true"
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
