//
//  CodeableBundleExtension.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-02-25.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String)-> T {
        //1. Locate the json File
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle")
        }
        
        //2. create a proptery for tha data
        guard let data = try? Data(contentsOf: url) else {
                fatalError("Failed to load \(file) bundle.")
        }
        
        // 3. Create a decoder
        
        let decoder = JSONDecoder()

        // Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from the bundle")
        }
    
        // 5. Return thr ready to use data
        return loaded
        
    }
}
