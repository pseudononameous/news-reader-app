//
//  ArticlerRepository.swift
//  news-reader-app
//
//  Created by Noel Chris Hernandez on 1/22/25.
//

import Foundation

protocol ArticleRepositoryProtocol {
    func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void)
}

class ArticleRepository: ArticleRepositoryProtocol {
    func fetchArticles(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=10ee48208c6840e0ac5698ca9b2ea768") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(NewsAPIResponse.self, from: data)
                completion(.success(decodedResponse.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
