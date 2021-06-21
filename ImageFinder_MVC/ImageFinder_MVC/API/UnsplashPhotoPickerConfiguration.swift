//
//  UnsplashPhotoPickerConfiguration.swift
//  ImageFinder_MVC
//
//  Created by 하동훈 on 2021/06/18.
//

import Foundation

struct  Configuration {
    static var shared: UnsplashPhotoPickerConfiguration = UnsplashPhotoPickerConfiguration()
}

public struct UnsplashPhotoPickerConfiguration {
    public var accessKey = "_6Gz9Ax5qlkm9RkWRBPBDDVcKT1gJ9awd34HaZ2HPYM"
    public var secretKey = "5EU3HvTy5AgiUB01HuMvrRCN1gkVAC-sWBPeWe2oj8o"
    public var query: String?
    public var allowsMultipleSelection = false
    public var memoryCapacity = 50
    public var diskCapacity = 100
    public var defaultMemoryCapacity: Int = 50
    public var defaultDiskCapacity: Int = 100
    let apiURL = "https://api.unsplash.com/"
    let editorialCollectionId = ""
    
    public init(accessKey: String,
                secretKey: String,
                query: String? = nil,
                allowsMultipleSelection: Bool = false,
                memoryCapacity: Int = 50,
                diskCapacity: Int = 100) {
        self.accessKey = accessKey
        self.secretKey = secretKey
        self.query = query
        self.allowsMultipleSelection = allowsMultipleSelection
        self.memoryCapacity = memoryCapacity
        self.diskCapacity = diskCapacity
    }
    
    init() {}
}
