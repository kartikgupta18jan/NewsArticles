//
//  ArticleView.swift
//  NewsArticals
//
//  Created by C 4 U on 05/03/25.
//  Copyright © 2025 Kartik. All rights reserved.
//
import Foundation
import SwiftUI
import Combine

struct ArticleView: View {
    @StateObject private var viewModel = ArticlesViewModel()
    @State private var isPresented:Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.articles) { article in
                        ZStack {
                            CardView(artical: article)
                                .onTapGesture {
                                    viewModel.selectedArticle = article
                                    isPresented.toggle()
                                }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("News Articles"))
            .sheet(isPresented: $isPresented){
                if let artical = viewModel.selectedArticle {
                    ArticleDetailView(artical: artical )
                }
            }
            .onAppear {
                viewModel.fetchArticles()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
    }
}
