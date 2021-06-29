//
//  Photo.swift
//  ImageFinder_MVC
//
//  Created by 하동훈 on 2021/06/21.
//

import UIKit
typealias Photos = [Photo]

public struct Photo: Codable {
    public struct Urls: Codable {
        let raw, full, regular, small, thumb: String
    }
    
    public let urls: Urls
}
