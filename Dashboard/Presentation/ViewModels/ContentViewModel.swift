//
//  ContentViewModel.swift
//  news-reader-app
//
//  Created by Noel Chris Hernandez on 1/22/25.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = true
    @Published var errorMessage: String? = nil
    
    private let fetchArticlesUseCase: FetchArticlesUseCaseProtocol
    
    init(fetchArticlesUseCase: FetchArticlesUseCaseProtocol) {
        self.fetchArticlesUseCase = fetchArticlesUseCase
    }
    
    func fetchArticles() {
        isLoading = true
        fetchArticlesUseCase.execute { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                case .failure(let error):
                    self?.errorMessage = "Failed to load articles. Error: \(error.localizedDescription)"
                }
                self?.isLoading = false
            }
        }
    }
    
    func formattedPublishedAt(_ publishedAt: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = formatter.date(from: publishedAt) {
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        return publishedAt
    }
}
