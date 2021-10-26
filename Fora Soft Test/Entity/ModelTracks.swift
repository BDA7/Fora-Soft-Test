//
//  ModelTracks.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 23.10.2021.
//

import Foundation

// Model for tracks of almub
struct ModelTracks: Decodable {
    var resultCount: Int
    var results: [Tracks]
}

struct Tracks: Decodable {
    var trackName: String?
    var artworkUrl100: String
    var collectionName: String
}
