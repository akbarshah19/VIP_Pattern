//
//  HomeModels.swift
//  VIP_Pattern
//
//  Created by Akbarshah Jumanazarov on 3/19/25.
//

import Foundation

enum HomeModels2 {
    struct Request {}
    struct Response {
        let joke: String
    }
    struct ViewModel {
        let message: String
    }
}

// Model for API response
struct Joke: Codable {
    let setup: String
    let punchline: String
}
