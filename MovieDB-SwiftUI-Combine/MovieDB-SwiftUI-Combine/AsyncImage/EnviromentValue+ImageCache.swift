//
//  EnviromentValue+ImageCache.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import SwiftUI

struct ImageChacheKey : EnvironmentKey {
    static let defaultValue : ImageCache = TemImageCache()
}
extension EnvironmentValues {
    var imageCache:ImageCache{
        get { self[ImageChacheKey.self]}
        set{ self[ImageChacheKey.self] = newValue}
    }
}
