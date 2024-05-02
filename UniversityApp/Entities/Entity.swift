//
//  ListingEntity.swift
//  UniversityApp
//
//  Created by Mohammed Umar Asif on 01/05/2024.
//

import UIKit

struct University{
    let name: String
    let state: String
    let webPages: [String]
    let alphaTwoCode: String
    let country: String
}

struct WelcomeElement: Codable {

let stateProvince: String?
let name: String
let webPages: [String]
let country: Country
let alphaTwoCode: AlphaTwoCode

    enum AlphaTwoCode: String, Codable {
        case ae = "AE"
    }

    enum Country: String, Codable {
        case unitedArabEmirates = "United Arab Emirates"
    }

    enum CodingKeys: String, CodingKey {
        case stateProvince = "state-province"
        case name
        case webPages = "web_pages"
        case country
        case alphaTwoCode = "alpha_two_code"
}
}
