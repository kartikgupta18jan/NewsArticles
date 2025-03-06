//
//  DetailView.swift
//  NewsArticals
//
//  Created by C 4 U on 06/03/25.
//  Copyright © 2025 Kartik. All rights reserved.
//

import Foundation
import SwiftUI

//struct DetailView: View {
//    let artical: NewsArticle
//    var body: some View {
//        VStack {
//            ZStack {
//                Rectangle()
//                        .fill(.thinMaterial)
//                        .frame(height: geometry.size.height * 0.55)
//                ArticleImageView(urlString: artical.urlToImage ?? "")
//
//            }
//            Text("Photo: \(artical.title ?? "")")
//                .padding([.bottom], 4)
//                .font(.caption)
//                .background(Color.black)
//                .foregroundColor(Color.white)
//            Text(artical.description ?? "")
//                .padding()
//
//            Spacer()
//        }
//    }
//}

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
                            ArticleImageView(urlString: artical.urlToImage ?? "")
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
