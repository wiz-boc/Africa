//
//  Video.swift
//  Africa
//
//  Created by wizz on 11/20/21.
//

import Foundation

struct Video: Codable,Identifiable {
    let id: String
    let name: String
    let headline: String
    var thumbnail:String {
        "video-\(id)"
    }
}
