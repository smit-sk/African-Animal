//
//  AnimalGridItemView.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-03-04.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal: AnimalModel
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider{
    
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
