//
//  ContentView.swift
//  news-reader-app
//
//  Created by Noel Chris Hernandez on 1/22/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel(fetchArticlesUseCase: FetchArticlesUseCase(articleRepository: ArticleRepository()))
    
    var body: some View {
        TabView {
            // Articles Tab
            NavigationView {
                VStack {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding()
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        if viewModel.articles.isEmpty {
                            Text("No articles available")
                                .font(.headline)
                                .padding()
                        } else {
                            List(viewModel.articles) { article in
                                VStack(alignment: .leading) {
                                    Text(article.title)
                                        .font(.headline)
                                    Text(article.author ?? "Unknown Author")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text(viewModel.formattedPublishedAt(article.publishedAt))
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                    Text(article.description ?? "No description available.")
                                        .font(.body)
                                        .lineLimit(2)
                                }
                                .padding()
                            }
                        }
                    }
                }
                .navigationTitle("Top Headlines")
                .onAppear {
                    viewModel.fetchArticles()
                }
            }
            .tabItem {
                Label("Articles", systemImage: "newspaper")
            }
            
            // Another Tab (e.g., Profile or Settings)
            NavigationView {
                VStack {
                    Text("Settings/Other Content Here")
                        .font(.largeTitle)
                }
                .navigationTitle("Settings")
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
