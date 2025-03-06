//
//  DetailView.swift
//  NewsArticals
//
//  Created by C 4 U on 06/03/25.
//  Copyright © 2025 Kartik. All rights reserved.
//

import Foundation
import SwiftUI

struct ArticleDetailView: View {
    let artical: NewsArticle
    var body: some View {
        GeometryReader(content: { geometry in
            VStack {
                ScrollView {
                    VStack {
                        ZStack{
                            Rectangle()
                                .fill(Color.clear)
                                .frame(height: geometry.size.height * 0.45)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Author: \(artical.author ?? "")")
                                    .font(.body)
                                    .fontWeight(.regular)
                                    .foregroundColor(.green)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                ArticleImageView(urlString: artical.urlToImage ?? "")
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text(artical.title ?? "")
                                .font(.largeTitle)
                                .fontWeight(.medium)
                                .padding(.bottom)
                            Text("Product Details")
                                .font(.body)
                                .fontWeight(.medium)
                                .padding(.bottom, 5)
                            Text(artical.description ?? "")
                                .foregroundColor(Color.gray)
                        }
                        .padding()
                    }
                }
            }
        })
        .edgesIgnoringSafeArea(.top)
    }
}
