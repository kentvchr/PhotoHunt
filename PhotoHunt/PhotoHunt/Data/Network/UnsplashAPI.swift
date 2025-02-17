//
//  UnsplashAPI.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import Foundation

struct UnsplashAPI {
    private let baseURL = "https://api.unsplash.com/"
    private let accessKey = "IvJLKCSVyg_w47M_Dy8Z2g_j_eCx7gYs5asn3azycs4"
    
    /// Creates a URLRequest for the popular photos endpoint
    func recentPhotos(page: Int = 1, perPage: Int = 30) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)photos?page=\(page)&per_page=\(perPage)") else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.setValue("Client-ID \(accessKey)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    /// Creates a URLRequest for the search photos endpoint
    func searchPhotos(query: String, page: Int = 1, perPage: Int = 30) -> URLRequest? {
        var components = URLComponents(string: "\(baseURL)search/photos")
        components?.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "per_page", value: "\(perPage)")
        ]
        
        guard let url = components?.url else { return nil }
        
        var request = URLRequest(url: url)
        request.setValue("Client-ID \(accessKey)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    func photoDetails(id: String) -> URLRequest? {
        guard let url = URL(string: "\(baseURL)photos/\(id)") else { return nil }
        
        var request = URLRequest(url: url)
        request.setValue("Client-ID \(accessKey)", forHTTPHeaderField: "Authorization")
        return request
    }
}
