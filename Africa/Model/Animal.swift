//
//  Animal.swift
//  Africa
//
//  Created by wizz on 11/17/21.
//

import Foundation

struct Animal: Codable,Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
