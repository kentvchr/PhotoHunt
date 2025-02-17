//
//  UserCollection.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

public class UserCollection: Codable {
    init(id: Int, title: String, publishedAt: String, lastCollectedAt: String, updatedAt: String, coverPhoto: String? = nil, user: String? = nil) {
        self.id = id
        self.title = title
        self.publishedAt = publishedAt
        self.lastCollectedAt = lastCollectedAt
        self.updatedAt = updatedAt
        self.coverPhoto = coverPhoto
        self.user = user
    }
    
    let id: Int
    let title: String
    let publishedAt: String
    let lastCollectedAt: String
    let updatedAt: String
    let coverPhoto: String?
    let user: String?
    
    static let mocked = [
        UserCollection(
            id: 206,
            title: "Makers: Cat and Ben",
            publishedAt: "2016-01-12T18:16:09-05:00",
            lastCollectedAt: "2016-06-02T13:10:03-04:00",
            updatedAt: "2016-07-10T11:00:01-05:00",
            coverPhoto: nil,
            user: nil
        )
    ]
}
