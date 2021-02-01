//
//  AsyncImage.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import SwiftUI
import Combine

struct AsyncImage<Placeholder: View>: View {
//    @StateOject private var loader : ImageLoader
    @StateObject private var loader: ImageLoader
    private let placeholer : Placeholder
    private let image : (UIImage) -> Image
    
    init(
        url: URL,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
        
    ) {
        self.placeholer = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    var body: some View{
        content.onAppear(perform: loader.load)
    }
    private var content: some View{
        Group{
            if loader.image != nil {
                image(loader.image!)
            }else{
                placeholer
            }
        }
    }
}
