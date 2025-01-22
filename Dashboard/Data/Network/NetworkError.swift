//
//  NetworkError.swift
//  news-reader-app
//
//  Created by Noel Chris Hernandez on 1/22/25.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
