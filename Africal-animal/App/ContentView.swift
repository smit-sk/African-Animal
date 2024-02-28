//
//  ContentView.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-02-23.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    
    var body: some View {
        NavigationView{
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals){animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)){
                        ListItemView(animals: animal)
                    }
                }
            }
           
            .navigationTitle("African Animal")
            
        }
    }
}

#Preview {
    ContentView()
}
