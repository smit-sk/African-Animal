//
//  AnimalModel.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-02-25.
//

import SwiftUI

struct AnimalModel : Codable, Identifiable {
    
    let id : String
    let name : String
    let headline : String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
    
}
