//
//  NewsArticle.swift
//  NewsArticals
//
//  Created by C 4 U on 05/03/25.
//  Copyright © 2025 Kartik. All rights reserved.
//

import Foundation

struct NewsArticle: Identifiable, Codable {
    let source: NewsArticleSource?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    let id = UUID()
}

struct NewsArticleSource: Codable, Hashable {
    let id: String?
    let name: String?
}

struct NewsResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [NewsArticle]?
}
