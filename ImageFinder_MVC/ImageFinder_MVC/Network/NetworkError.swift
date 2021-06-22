//
//  NetworkError.swift
//  ImageFinder_MVC
//
//  Created by 하동훈 on 2021/06/22.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case unsuccessfulResponse
    case APIInvalidResponse
    case unknownError(message: String)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .unsuccessfulResponse: return "Unsuccessful Response"
        case .APIInvalidResponse: return "API Invalid Response"
        case .unknownError(let message): return "Unknown error: \(message)"
        }
    }
}
