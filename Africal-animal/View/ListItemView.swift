//
//  ListItemView.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-02-25.
//

import SwiftUI

struct ListItemView: View {
    
    let animals : AnimalModel
    
    var body: some View {
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 16){
            Image(animals.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius:12)
                )
            
            VStack(alignment: .leading){
                Text(animals.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animals.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
                    
                
            }
        }
    }
}

struct ListItemView_Previews : PreviewProvider {
    static let animal : [AnimalModel] =
        Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ListItemView(animals: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}
