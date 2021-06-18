//
//  ImageCache.swift
//  ImageFinder_MVC
//
//  Created by 하동훈 on 2021/06/18.
//

import Foundation

class ImageCache {
    static let cache: URLCache = {
        let diskPath = "unsplash"
        
        if #available(iOS 13.0, *) {
            return URLCache(
                memoryCapacity: Configuration.shared.memoryCapacity,
                diskCapacity: Configuration.shared.diskCapacity,
                directory: URL(fileURLWithPath: diskPath, isDirectory: true)
            )
        } else {
            #if !targetEnvironment(macCatalyst)
            return URLCache(
                memoryCapacity: Configuration.shared.memoryCapacity,
                diskCapacity: Configuration.shared.diskCapacity,
                diskPath: diskPath
            )
            #else
            fatalError()
            #endif
        }
    }()
    
    static let memoryCapacity: Int = 50.megabytes
    static let diskCapacity: Int = 100.megabytes
}

private extension Int {
    var megabytes: Int { return self * 1024 * 1024 }
}
