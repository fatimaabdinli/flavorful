//
//  NetworkHelper.swift
//  URLSessionProject
//
//  Created by Fagan Aslanli on 30.01.24.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum ErrorTypes: String, Error {
    case authError = "Auth Error"
    case generalError = "General"
    case unknownError = "Unknown Error"
    case invalidData = "Invalid Data"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private let baseURL = "https://api.spoonacular.com/recipes"

    let header = [
        "accept": "application/json"
    ]
    
    func requestURL(url: String) -> String {
        let keyData = "apiKey=7998fdd620cf4d4fa490985e0ab8d203"
        let finalUrl = url.contains("?") ? url + "&\(keyData)" : url + "?\(keyData)"
        return baseURL + finalUrl
    }
}
