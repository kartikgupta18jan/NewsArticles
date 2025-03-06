//
//  CardView.swift
//  NewsArticals
//
//  Created by C 4 U on 06/03/25.
//  Copyright © 2025 Kartik. All rights reserved.
//

import Foundation
import SwiftUI
struct CardView: View {
    let artical: NewsArticle
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("Author: \(artical.author ?? "")")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.green)
                    .multilineTextAlignment(.leading)
                ArticleImageView(urlString: artical.urlToImage ?? "")
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(artical.title ?? "")
                    .font(.headline)
                Text(artical.description ?? "No description available")
                    .font(.subheadline)
                    .lineLimit(3)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 0.5)
                .shadow(radius: 0.5)
        )
        .padding(.horizontal, 10)
    }
}
