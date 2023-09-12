//
//  ModelUser.swift
//  Fora Soft Test
//
//  Created by Данила Бондаренко on 12.09.2023.
//

import Foundation

struct ModelUser: Codable {
    var email: String
    var password: String
}

struct RequestAuth: Codable {
    var flag: Bool
}
