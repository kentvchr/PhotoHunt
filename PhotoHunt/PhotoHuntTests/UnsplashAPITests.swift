//
//  UnsplashAPITests.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 04/11/2024.
//

import XCTest
@testable import PhotoHunt

final class UnsplashAPITests: XCTestCase {
    var unsplashAPI: UnsplashAPI!
    
    override func setUp() {
        super.setUp()
        unsplashAPI = UnsplashAPI()
    }

    override func tearDown() {
        unsplashAPI = nil
        super.tearDown()
    }

    func testRecentPhotosRequest() {
        let request = unsplashAPI.recentPhotos(page: 1, perPage: 10)
        
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.absoluteString, "https://api.unsplash.com/photos?page=1&per_page=10")
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Authorization"), "Client-ID IvJLKCSVyg_w47M_Dy8Z2g_j_eCx7gYs5asn3azycs4")
    }

    func testSearchPhotosRequest() {
        let request = unsplashAPI.searchPhotos(query: "nature", page: 1, perPage: 10)
        
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.absoluteString, "https://api.unsplash.com/search/photos?query=nature&page=1&per_page=10")
        XCTAssertEqual(request?.value(forHTTPHeaderField: "Authorization"), "Client-ID IvJLKCSVyg_w47M_Dy8Z2g_j_eCx7gYs5asn3azycs4")
    }
}
