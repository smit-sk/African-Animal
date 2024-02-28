//
//  InsetFactView.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-02-28.
//

import SwiftUI

struct InsetFactView: View {
    let animal : AnimalModel
    
    var body: some View {
        Group {
            
            TabView{
                ForEach(animal.fact, id:\.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
            
            
        }//: GROUP BOX
        
    }
}

struct InsetFactView_Previews : PreviewProvider {
    
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
