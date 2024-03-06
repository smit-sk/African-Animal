//
//  CenterModifier.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-03-05.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content)-> some View{
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

