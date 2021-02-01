//
//  ImageLoader.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import Combine
import UIKit

final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private(set) var isLoading = false
    
    private let url : URL
    private var cache : ImageCache?
    private var cancellabe: AnyCancellable?
    
    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")
    
    
    init(url: URL, cache: ImageCache? = nil) {
        self.url = url
        self.cache = cache
    }
    deinit {
        cancel()
    }
    func cancel(){
        cancellabe?.cancel()
    }
    func load(){
        guard !isLoading else {
            return
        }
        if let image = cache?[url]{
            self.image = image
            return
        }
        
        cancellabe = URLSession.shared.dataTaskPublisher(for: url)
            .map({UIImage(data: $0.data)})
            .replaceError(with: nil)
            .handleEvents(
                receiveSubscription: {  [weak self] _ in self?.onstart()  },
                receiveOutput: {  [weak self] in self?.cache($0) },
                receiveCompletion: {  [weak self] _ in self?.onFinish() },
                receiveCancel: { [weak self] in self?.onFinish()})
            .subscribe(on: ImageLoader.imageProcessingQueue)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in  self?.image = $0 })
            
    }
    private func onstart(){
        isLoading = true
    }
    private func onFinish(){
        isLoading = false
    }
    private func cache(_ image: UIImage?){
        image.map{cache?[url] = $0}
    }
}
