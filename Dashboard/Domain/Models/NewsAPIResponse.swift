//
//  NewsAPIResponse.swift
//  news-reader-app
//
//  Created by Noel Chris Hernandez on 1/22/25.
//

import Foundation

struct NewsAPIResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
