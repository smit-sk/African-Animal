//
//  ExternalWebView.swift
//  Africal-animal
//
//  Created by SMIT KHOKHARIYA on 2024-02-28.
//

import SwiftUI

struct ExternalWebView: View {
    let animal: AnimalModel
    var body: some View {
        Group {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}



struct ExternalWebView_Previews : PreviewProvider {
    static let animal : [AnimalModel] =
        Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}
