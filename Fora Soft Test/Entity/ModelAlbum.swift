//
//  ModelAlbum.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation

struct ModelAlbum: Decodable {
    var resultCount: Int
    var results: [Album]
}

struct Album: Decodable {
    var collectionName: String
    var artworkUrl100: String
    var collectionId: Int
    var artistName: String
    var primaryGenreName: String
}
