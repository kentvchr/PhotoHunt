//
//  Tag.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

public class Tag {
    init(title: String) {
        self.title = title
    }
    
    let title: String
    
    static let mocked = [
        Tag(title: "man"),
        Tag(title: "drinking"),
        Tag(title: "coffee")
    ]
}
