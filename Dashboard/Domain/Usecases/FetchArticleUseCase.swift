//
//  FetchArticleUseCase.swift
//  news-reader-app
//
//  Created by Noel Chris Hernandez on 1/22/25.
//

import Foundation

protocol FetchArticlesUseCaseProtocol {
    func execute(completion: @escaping (Result<[Article], Error>) -> Void)
}

class FetchArticlesUseCase: FetchArticlesUseCaseProtocol {
    private let articleRepository: ArticleRepositoryProtocol
    
    init(articleRepository: ArticleRepositoryProtocol) {
        self.articleRepository = articleRepository
    }
    
    func execute(completion: @escaping (Result<[Article], Error>) -> Void) {
        articleRepository.fetchArticles { result in
            completion(result)
        }
    }
}
