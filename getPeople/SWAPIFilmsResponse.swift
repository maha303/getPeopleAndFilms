//
//  SWAPIFilmsResponse.swift
//  getPeople
//
//  Created by Maha saad on 17/05/1443 AH.
//

import Foundation

// MARK: - SWAPIFilmsResponse
struct SWAPIFilmsResponse: Codable {
    let count: Int
    let results: [Result]
}

// MARK: - Result
struct Result : Codable {
    let title: String
    let episode_id: Int
    let opening_crawl: String
    let director: String
    let producer: String
    let release_date: String
    let characters: [String]
    let planets: [String]
    let starships: [String]
    let vehicles: [String]
    let species: [String]
    let created: String
    let edited: String
    let url: String
}

