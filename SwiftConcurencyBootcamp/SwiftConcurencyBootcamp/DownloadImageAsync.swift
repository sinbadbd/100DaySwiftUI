//
//  DownloadImageAsync.swift
//  SwiftConcurencyBootcamp
//
//  Created by Imran on 27/4/22.
//

import SwiftUI
import Combine

class DownloadImageAsyncImageLoader{
    let url = URL(string: "https://picsum.photos/200")!
    
    
    func hangleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard
            let data = data,
            let image = UIImage(data: data),
            let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
             return nil
        }
        
        return image
    }
    
    func downloadWithEscaping(completionHandler: @escaping (_ image:UIImage?, _ error: Error?) -> ()){
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            let image = self?.hangleResponse(data: data, response: response)
            completionHandler(image, nil)
        }
        .resume()
    }
    
    
    func downloadWithCombine() -> AnyPublisher<UIImage?, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(hangleResponse)
            .mapError( { $0 } )
            .eraseToAnyPublisher()
    }
}

class DownloadImageAsyncViewModel: ObservableObject {
    
    @Published var image:UIImage? = nil
    
    let loader = DownloadImageAsyncImageLoader()
    var cancellable = Set<AnyCancellable>()
    
    func fetchImage(){
        /*
        loader.downloadWithEscaping { [weak self] image, error in
            DispatchQueue.main.async {
                self?.image = image
            }
        }*/
        
        loader.downloadWithCombine()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] image in
                DispatchQueue.main.async {
                    self?.image = image
                }
            }.store(in: &cancellable)
    }
}

struct DownloadImageAsync: View {
    
    @StateObject private var viewModel = DownloadImageAsyncViewModel()
 
    var body: some View {
        ZStack{
             if let image = viewModel.image {
                 Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
//                    .background(Color.red)
            }
        }
        .onAppear {
            viewModel.fetchImage()
        }

    }
}

struct DownloadImageAsync_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageAsync()
    }
}
