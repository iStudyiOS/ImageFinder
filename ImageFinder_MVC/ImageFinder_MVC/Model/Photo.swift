//
//  Photo.swift
//  ImageFinder_MVC
//
//  Created by 하동훈 on 2021/06/21.
//

import UIKit

public struct Photo: Codable {
    public enum URLKind: String, Codable {
        case raw
        case full
        case regular
        case small
        case thumb
    }
    
    public enum LinkKind: String, Codable {
        case own = "self"
        case html
        case download
        case downloadLocation = "download_location"
    }
    
    public let identifier: String
    public let urls: [URLKind: URL]
    public let links: [LinkKind: URL]
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case urls
        case links
    }
}
