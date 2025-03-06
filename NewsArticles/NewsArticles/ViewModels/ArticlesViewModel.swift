//
//  ArticlesViewModel.swift
//  NewsArticals
//
//  Created by C 4 U on 05/03/25.
//  Copyright © 2025 Kartik. All rights reserved.
//

import Combine
import Foundation

class ArticlesViewModel: ObservableObject {
    @Published var articles: [NewsArticle] = []
    @Published var selectedArticle: NewsArticle?
    private var cancellables: Set<AnyCancellable> = []

    private let newsAPI = NewsAPI()

    func fetchArticles() {
        newsAPI.fetchArticles { [weak self] result in
            switch result {
            case .success(let articles):
                DispatchQueue.main.async {
                    self?.articles = articles
                }
            case .failure(let error):
                print("Error fetching articles: \(error.localizedDescription)")
            }
        }
    }
}
