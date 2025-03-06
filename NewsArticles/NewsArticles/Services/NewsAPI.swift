//
//  NewsAPI.swift
//  NewsArticals
//
//  Created by C 4 U on 05/03/25.
//  Copyright © 2025 Kartik. All rights reserved.
//

import Foundation

class NewsAPI {
    private let apiKey = "7c5eeb33be5f4fdaa8bb3e9b7349672d" // Replace with your actual API key
    private let urlString = "https://newsapi.org/v2/everything?q=apple&from=2025-03-04&to=2025-03-04&sortBy=popularity&apiKey="

    func fetchArticles(completion: @escaping (Result<[NewsArticle], Error>) -> Void) {
        guard let url = URL(string: urlString + apiKey) else {
            return completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let data = data else {
                return completion(.failure(NSError(domain: "No Data", code: 400, userInfo: nil)))
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(NewsResponse.self, from: data)
                completion(.success(response.articles ?? []))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
