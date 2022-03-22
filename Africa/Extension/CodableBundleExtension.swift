//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by wizz on 11/14/21.
//

import Foundation


extension Bundle {
    func decode<T: Codable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load from \(file) in bundle")
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data from \(file) in bundle")
        }
        
        return loaded
    }
}
