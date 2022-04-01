//
//  CoinImageService.swift
//  Crypto
//
//  Created by Imran on 1/4/22.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubscription: AnyCancellable?
    
    private let coin: CoinModel
    
    private let fileManager = LocalFileManager.intance
    private let folderName = "coin_image"
    private let imagName: String
    
    init(coin: CoinModel){
        self.coin = coin
        self.imagName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage(){
        if let saveImage =  fileManager.getImage(imageName: imagName, folderName: folderName) {
            image = saveImage
            print("Retrived image form File Manager")
        }else {
            downloadCoinImage()
            print("Download image now")
        }
    }
    
    private func downloadCoinImage(){
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription =  NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] img in
                guard let self = self, let dowloadImage = img else { return }
                self.image = dowloadImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: dowloadImage, imageName: self.imagName, folderName: self.folderName)
            })
    }
}
