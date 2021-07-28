//
//  DogModel.swift
//  SwiftUIOkanDSC
//
//  Created by Veli Bacik on 28.07.2021.
//

struct DogModel: Codable {
    let code: Int
    let welcomeDescription: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case code
        case welcomeDescription = "description"
        case imageURL = "imageUrl"
    }
}
