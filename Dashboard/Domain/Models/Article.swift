//
//  Article.swift
//  news-reader-app
//
//  Created by Noel Chris Hernandez on 1/22/25.
//

import Foundation

struct Article: Codable, Identifiable {
    let id = UUID()
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
