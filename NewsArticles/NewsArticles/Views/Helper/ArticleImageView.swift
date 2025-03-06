//
//  ArticleImageView.swift
//  NewsArticals
//
//  Created by C 4 U on 05/03/25.
//  Copyright © 2025 Kartik. All rights reserved.
//
import SwiftUI
import Combine

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil
    private var cancellable: AnyCancellable?
    
    func loadImage(from urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        
        if let cachedImage = ImageCache.shared.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] image in
                self?.image = image
                if let image = image {
                    ImageCache.shared.setObject(image, forKey: urlString as NSString)
                }
            }
    }
}
struct ArticleImageView: View {
    @StateObject private var loader = ImageLoader()
    let urlString: String?
    
    var body: some View {
        Image(uiImage: loader.image ?? UIImage())
            .resizable()
            .scaledToFit()
            .onAppear {
                loader.loadImage(from: urlString)
            }
    }
}
